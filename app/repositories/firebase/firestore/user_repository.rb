module Firebase
  module Firestore
    class UserRepository

      attr_accessor :firebase_user

      def initialize
        @firebase_user = Firebase::Firestore::CommunicationUser.new
      end

      def access_account(email, password)
        firebase_user.login_on_firebase(email, password)
      end
    end
  end
end