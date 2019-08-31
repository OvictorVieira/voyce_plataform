module Firebase
  module Firestore
    class Communication < FirebaseBase

      include ::Formatters::ResponseFormatter

      attr_reader :communicator

      def initialize
        @communicator = Firebase::FirebaseBas.new.firebase
      end

      def get
      end

      def post
      end

      def put
      end

      def delete
      end

    end
  end
end