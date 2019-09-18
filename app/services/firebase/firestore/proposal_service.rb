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
        fields = format_data_to_update
        check_fields_passed = verify_fields_are_present(fields)
        raise_exception(FieldsAreNotPresentError) unless check_fields_passed

        validate_the_price_is_valid
        create_proposal
      end

      def update_proposal
        formated_data = format_data_to_update.merge!(proposal_id: data[:proposal_id])
        firestore_response = proposal_repository.update_proposal(data[:user_id], formated_data)
        raise_exception(firestore_response[:message]) unless firestore_response[:success]

        firestore_response[:proposals]
      end

      private

      def create_proposal
        firestore_response = proposal_repository.create_proposal(data[:user_id], format_data_to_update)
        raise_exception(firestore_response[:message]) unless firestore_response[:success]

        firestore_response[:proposals]
      end

      def format_data_to_update
        {
          name: data[:proposal_name],
          price: data[:price],
          description: data[:description],
          status:  Firebase::Firestore::ProposalRepository::STATUS_ACTIVE
        }
      end

      def validate_the_price_is_valid
        begin
          valid_float? data[:price]
        rescue => error
          raise PriceIsNotValidValueError
        end
      end
    end
  end
end