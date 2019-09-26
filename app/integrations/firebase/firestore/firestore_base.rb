module Firebase
  module Firestore
    class FirestoreBase

      attr_reader :firestore

      def initialize
        @firestore = create_firestore_connection
      end

      protected

      def create_firestore_connection
        Google::Cloud::Firestore.new
      end

    end
  end
end