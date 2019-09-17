module Firebase
  module Firestore
    class ProposalService

      include RepositoryBase

      attr_reader :proposal_repository, :data

      def initialize(args)
        @data = args
        @proposal_repository = ProposalRepository.new
      end

      def load_all_proposals
        firestore_response = proposal_repository.load_all_proposals(data[:user_id])
        raise_exception(firestore_response[:message]) unless firestore_response[:success]

        firestore_response[:proposals]
      end

      def create_proposal
        firestore_response = proposal_repository.create_proposal(data[:user_id], format_data_to_update)
        raise_exception(firestore_response[:message]) unless firestore_response[:success]

        firestore_response[:proposals]
      end

      def edit_proposal
        data_to_format = format_data_to_update.merge!(proposal_id: data[:proposal_id])
        firestore_response = proposal_repository.edit_proposal(data[:user_id], data_to_format)
        raise_exception(firestore_response[:message]) unless firestore_response[:success]

        firestore_response[:proposals]
      end

      private

      def format_data_to_update
        {
          name: data[:proposal_name],
          price: data[:price],
          description: data[:description],
          status:  Firebase::Firestore::ProposalRepository::STATUS_ACTIVE
        }
      end
    end
  end
end