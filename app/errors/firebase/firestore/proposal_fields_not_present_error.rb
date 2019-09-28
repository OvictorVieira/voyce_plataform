module Firebase
  module Firestore
    class ProposalFieldsNotPresentError < StandardError

      def initialize
        super(I18n.t('dashboard.proposals.errors.invalid_fields'))
      end
    end
  end
end