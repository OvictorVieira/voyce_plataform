module Firebase
  module Firestore
    class FieldsAreNotPresentError < StandardError

      def initialize
        super(I18n.t('dashboard.proposals.errors.fields_are_not_present'))
      end
    end
  end
end