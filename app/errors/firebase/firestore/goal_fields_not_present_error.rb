module Firebase
  module Firestore
    class GoalFieldsNotPresentError < StandardError

      def initialize
        super(I18n.t('dashboard.goals.error.invalid_fields'))
      end
    end
  end
end