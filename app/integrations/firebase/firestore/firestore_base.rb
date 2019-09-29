module Firebase
  module Firestore
    class FirestoreBase

      attr_reader :firestore

      FIRESTORE_URL_BASE_BUCKET = 'https://firebasestorage.googleapis.com/v0'.freeze
      FIRESTORE_PRIVATE_URL_BASE = 'https://www.googleapis.com/storage/v1'.freeze
      FIRESTORE_URL_ALT_MEDIA = '?alt=media'.freeze

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