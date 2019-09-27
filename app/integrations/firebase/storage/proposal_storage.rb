module Firebase
  module Storage
    class ProposalStorage

      include Formatters::ResponseFormatter

      IMAGE_PROPOSAL_BUCKET = 'proposals_images'.freeze

      attr_reader :storage, :bucket_name

      def initialize
        storage_base = StorageBase.new
        @storage = storage_base.storage
        @bucket_name = storage_base.bucket
      end

      def save_image_on_storage(image, user_id)
        begin
          bucket = storage.bucket(bucket_name)
          image_uploaded = bucket.create_file(image.tempfile.path,
                                              "#{IMAGE_PROPOSAL_BUCKET}/#{user_id}/#{image.original_filename}")
          success(image: image_uploaded.gapi)
        rescue
          fail
        end
      end
    end
  end
end