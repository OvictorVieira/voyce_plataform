module Firebase
  module Firestore
    class CreateGoalError < StandardError

      def initialize
        super(I18n.t('dashboard.goals.error.create_goal_error'))
      end
    end
  end
end