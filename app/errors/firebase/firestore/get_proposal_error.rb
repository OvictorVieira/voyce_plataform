module Firebase
  module Firestore
    class GetProposalError < StandardError

      def initialize
        super(I18n.t('dashboard.proposals.errors.get_proposal_error'))
      end
    end
  end
end