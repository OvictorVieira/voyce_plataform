module Firebase
  module Storage
    class MusicStorage

      include Formatters::ResponseFormatter

      MUSIC_BUCKET = 'musics'.freeze
      IMAGE_PROPOSAL_BUCKET = 'images'.freeze

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
                                              "#{MUSIC_BUCKET}/#{IMAGE_PROPOSAL_BUCKET}/#{user_id}/#{image.original_filename}")
          success(image: image_uploaded.gapi)
        rescue
          fail
        end
      end

      def save_music_on_storage(music, user_id)
        begin
          bucket = storage.bucket(bucket_name)
          music_uploaded = bucket.create_file(music.tempfile.path,
                                              "#{MUSIC_BUCKET}/#{user_id}/#{music.original_filename}")
          success(music: music_uploaded.gapi)
        rescue
          fail
        end
      end
    end
  end
end