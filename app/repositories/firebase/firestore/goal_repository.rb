module Firebase
  module Firestore
    class GoalRepository

      attr_accessor :goal_firestore

      def initialize
        @goal_firestore = GoalFirestore.new
      end

      def load_all_goals(user_id)
        goal_firestore.load_all_goals(user_id)
      end

      def create_goal(user_id, data)
        goal_firestore.create_goal(user_id, data)
      end

      def load_goal(user_id, goal_id)
        goal_firestore.load_goal(user_id, goal_id)
      end

      def update_goal(user_id, data)
        goal_firestore.update_goal(user_id, data)
      end
    end
  end
end