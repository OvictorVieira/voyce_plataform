module Firebase
  module Firestore
    class GetGoalsError < StandardError

      def initialize
        super(I18n.t('dashboard.goals.error.get_goals_error'))
      end
    end
  end
end