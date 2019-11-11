module Firebase
  module Firestore
    class GoalService

      include RepositoryBase
      include Firebase::Validator

      attr_reader :goal_repository, :data

      def initialize(args)
        @data = args
        @goal_repository = GoalRepository.new
      end

      def load_all_goals
        firestore_response = goal_repository.load_all_goals(data[:user_id])
        raise_exception(firestore_response[:message]) unless firestore_response[:success]

        firestore_response
      end

      def process_creation
        fields_formatted = format_data_to_send
        check_fields_passed = verify_fields_are_present(fields_formatted)
        raise_exception(GoalFieldsNotPresentError) unless check_fields_passed

        validate_the_price_is_valid

        create_goal(fields_formatted.merge!(current_value: 0))
      end

      def load_goal
        firestore_response = goal_repository.load_goal(data[:user_id], data[:goal_id])
        raise_exception(firestore_response[:message]) unless firestore_response[:success]

        firestore_response[:goal]
      end

      def process_update
        fields_formatted = format_data_to_send
        check_fields_passed = verify_fields_are_present(fields_formatted)
        raise_exception(GoalFieldsNotPresentError) unless check_fields_passed

        validate_the_price_is_valid

        update_goal(fields_formatted)
      end

      private

      def create_goal(fields_formatted)
        firestore_response = goal_repository.create_goal(data[:user_id], fields_formatted)
        raise_exception(firestore_response[:message]) unless firestore_response[:success]

        firestore_response[:proposals]
      end

      def update_goal(fields_formatted)
        fields_formatted.merge!(goal_id: data[:goal_id])
        firestore_response = goal_repository.update_goal(data[:user_id], fields_formatted)
        raise_exception(firestore_response[:message]) unless firestore_response[:success]

        firestore_response[:goals]
      end

      def validate_the_price_is_valid
        begin
          valid_float? data[:price]
        rescue
          raise PriceIsNotValidValueError
        end
      end

      def format_data_to_send
        {
          price: data[:price].to_f,
          description: data[:description]
        }
      end

    end
  end
end