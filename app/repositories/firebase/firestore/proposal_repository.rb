module Firebase
  module Firestore
    class ProposalRepository

      STATUS_ACTIVE = 1

      PROPOSAL_STATUSES = [
        I18n.t('dashboard.proposals.statuses.inactive'),
        I18n.t('dashboard.proposals.statuses.active')
      ]

      attr_accessor :proposal_firestore, :proposal_storage

      def initialize
        @proposal_firestore = ProposalFirestore.new
        @proposal_storage = Storage::ProposalStorage.new
      end

      def load_proposal(user_id, proposal_id)
        proposal_firestore.load_proposal(user_id, proposal_id)
      end

      def load_all_proposals(user_id)
        proposal_firestore.load_all_proposals(user_id)
      end

      def create_proposal(user_id, data)
        proposal_firestore.process_creation_proposal(user_id, data)
      end

      def update_proposal(user_id, data)
        proposal_firestore.process_update_proposal(user_id, data)
      end

      def save_image_on_storage(image)
        proposal_storage.save_image_on_storage(image)
      end
    end
  end
end