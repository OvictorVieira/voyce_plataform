module Firebase
  module Firestore
    class UserService

      attr_reader :user_repository

      def initialize
        @user_repository = Firebase::Firestore::UserRepository.new
      end

      def access_account(args)
        email = args[:email]
        password = args[:password]
        firebase_user = user_repository.access_account(email, password)
        raise_exception(firebase_user[:message]) unless firebase_user[:success]

        firebase_user[:user_data]
      end

      private

      def raise_exception(message)
        raise message
      end
    end
  end
end