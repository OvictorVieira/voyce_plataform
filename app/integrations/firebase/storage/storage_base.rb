module Firebase
  module Storage
    class StorageBase

      attr_reader :storage, :bucket

      def initialize
        @storage = create_storage_connection
        @bucket = load_bucket
      end

      protected

      def create_storage_connection
        Google::Cloud::Storage.new
      end

      def load_bucket
        Rails.application.config.app.firebase.storage.bucket
      end
    end
  end
end