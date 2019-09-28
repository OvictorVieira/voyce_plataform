module Firebase
  module Firestore
    class ProposalService

      include RepositoryBase
      include Validator

      attr_reader :proposal_repository, :data

      def initialize(args)
        @data = args
        @proposal_repository = ProposalRepository.new
      end

      def load_proposal
        firestore_response = proposal_repository.load_proposal(data[:user_id], data[:proposal_id])
        raise_exception(firestore_response[:message]) unless firestore_response[:success]

        firestore_response[:proposal]
      end

      def load_all_proposals
        firestore_response = proposal_repository.load_all_proposals(data[:user_id])
        raise_exception(firestore_response[:message]) unless firestore_response[:success]

        firestore_response[:proposals]
      end

      def process_creation
        fields_formated = format_data_to_send
        check_fields_passed = verify_fields_are_present(fields_formated)
        raise_exception(FieldsAreNotPresentError) unless check_fields_passed

        validate_valid_file
        validate_the_price_is_valid
        image_uploaded = save_image_on_storage

        image = image_uploaded[:image]
        create_proposal(fields_formated.merge!(image: image.self_link))
      end

      def process_update
        fields_formated = format_data_to_send
        check_fields_passed = verify_fields_are_present(fields_formated)
        raise_exception(ProposalFieldsNotPresentError) unless check_fields_passed

        validate_the_price_is_valid

        if data['proposal_image'].present?
          image_uploaded = save_image_on_storage

          image = image_uploaded[:image]
          fields_formated.merge(image: image.self_link)
        end

        update_proposal(fields_formated)
      end

      private

      def save_image_on_storage
        image_uploaded = proposal_repository.save_image_on_storage(data[:user_id], data['proposal_image'])
        raise_exception(Storage::SaveImageError) unless image_uploaded[:success]

        image_uploaded
      end

      def update_proposal(fields_formated)
        fields_formated.merge!(proposal_id: data[:proposal_id])
        firestore_response = proposal_repository.update_proposal(data[:user_id], fields_formated)
        raise_exception(firestore_response[:message]) unless firestore_response[:success]

        firestore_response[:proposals]
      end

      def create_proposal(fields_formated)
        firestore_response = proposal_repository.create_proposal(data[:user_id], fields_formated)
        raise_exception(firestore_response[:message]) unless firestore_response[:success]

        firestore_response[:proposals]
      end

      def format_data_to_send
        {
          name: data[:proposal_name],
          price: data[:price],
          description: data[:description],
          status:  ProposalRepository::STATUS_ACTIVE
        }
      end

      def validate_the_price_is_valid
        begin
          valid_float? data[:price]
        rescue
          raise PriceIsNotValidValueError
        end
      end

      def validate_valid_file
        begin
          raise Storage::InvalidImageFormatError unless validates_format_image(data['proposal_image'].content_type)
        rescue
          raise Storage::ImageObligatoryError
        end
      end
    end
  end
end