module Firebase
  module Firestore
    class CommunicationUser

      LOGIN_END_POINT = 'signInWithPassword'.freeze

      attr_accessor :communicator

      def initialize
        @communicator = Communication.new(LOGIN_END_POINT)
      end

      def login_on_firebase(email, password)
        body = body_for_login(email, password)
        communicator.post(body)
      end

      private

      def body_for_login(email, password)
        {
          email: email,
          password: password,
          returnSecureToken: true
        }
      end
    end
  end
end