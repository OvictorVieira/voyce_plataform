module Firebase
  module Firestore
    class CreateProposalError < StandardError

      def initialize
        super(I18n.t('dashboard.proposals.errors.create_proposal_error'))
      end
    end
  end
end