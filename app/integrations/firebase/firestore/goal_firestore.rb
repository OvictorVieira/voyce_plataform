module Firebase
  module Firestore
    class GoalFirestore

      include Formatters::ResponseFormatter

      USER_END_POINT = 'users'.freeze
      GOAL_END_POINT = 'goals'.freeze

      attr_reader :firestore_base

      def initialize
        @firestore_base = FirestoreBase.new.firestore
      end

      def load_goal(user_id, goal_id)
        begin
          goal = firestore_base.col(USER_END_POINT).doc(user_id).col(GOAL_END_POINT).doc(goal_id)

          success(goal: goal.get)
        rescue => error
          fail(message: GetGoalsError)
        end
      end

      def load_all_goals(user_id)
        begin
          goals = firestore_base.col(USER_END_POINT).doc(user_id).col(GOAL_END_POINT).order(:price).get

          success(goals: goals)
        rescue => error
          fail(message: GetGoalsError)
        end
      end

      def create_goal(user_id, data)
        begin
          firestore_base.col(USER_END_POINT).doc(user_id).col(GOAL_END_POINT).add(data)

          success
        rescue => error
          fail(message: CreateGoalError)
        end
      end

      def update_goal(user_id, data)
        begin
          firestore_base.col(USER_END_POINT).doc(user_id).col(GOAL_END_POINT).doc(data[:goal_id]).update(data)

          success
        rescue => error
          fail(message: UpdateProposalError, error: error.message)
        end
      end
    end
  end
end