module Firebase
  module Firestore
    class UpdateProposalError < StandardError

      def initialize
        super(I18n.t('dashboard.proposals.errors.update_proposal_error'))
      end
    end
  end
end