module Firebase
  module Firestore
    class MusicService

      include RepositoryBase
      include Firebase::Validator

      attr_reader :music_repository, :data

      def initialize(args)
        @data = args
        @music_repository = MusicRepository.new
      end

      def load_all_songs
        firestore_response = music_repository.load_all_songs(data[:user_id])
        raise_exception(firestore_response[:message]) unless firestore_response[:success]

        firestore_response
      end

      def load_song
        firestore_response = music_repository.load_song(data[:user_id], data[:music_id])
        raise_exception(firestore_response[:message]) unless firestore_response[:success]

        firestore_response[:music]
      end

      def process_creation
        fields_formated = format_data_to_send
        check_fields_passed = verify_fields_are_present(fields_formated)
        raise_exception(MusicFieldsNotPresentError) unless check_fields_passed

        validate_valid_audio_file
        validate_valid_image_file
        formated_data = format_data_to_send

        upload_image(formated_data)
        upload_music(formated_data)

        create_music(formated_data)
      end

      def process_update
        fields_formated = format_data_to_update
        check_fields_passed = verify_fields_are_present(fields_formated)
        raise_exception(MusicFieldsNotPresentError) unless check_fields_passed

        formated_data = format_data_to_update
        update_music(formated_data)
      end

      private

      def upload_image(formated_data)
        image_uploaded = save_image_on_storage
        formated_data.merge(image: create_public_urls(image_uploaded[:image]))
      end

      def upload_music(formated_data)
        music_uploaded = save_music_on_storage
        formated_data.merge(music: create_public_urls(music_uploaded[:music]))
      end

      def save_image_on_storage
        image_uploaded = music_repository.save_image_on_storage(data['image_cover'], data['user_id'])
        raise_exception(Storage::SaveImageError) unless image_uploaded[:success]

        image_uploaded
      end

      def save_music_on_storage
        music_uploaded = music_repository.save_music_on_storage(data['music_file'], data['user_id'])
        raise_exception(Storage::SaveMusicError) unless music_uploaded[:success]

        music_uploaded
      end

      def create_music(fields_formated)
        firestore_response = music_repository.create_music(data[:user_id], fields_formated)
        raise_exception(firestore_response[:message]) unless firestore_response[:success]

        firestore_response[:musics]
      end

      def update_music(fields_formated)
        firestore_response = music_repository.update_music(data[:user_id], data[:music_id], fields_formated)
        raise_exception(firestore_response[:message]) unless firestore_response[:success]

        firestore_response
      end

      def format_data_to_send
        {
          title: data[:music_title],
          sequence: data[:number_track],
          status: MusicRepository::STATUS_PENDING_REVIEW,
          message: I18n.t('dashboard.musics.messages.music_pending_review')
        }
      end

      def format_data_to_update
        {
          title: data[:music_title],
          sequence: data[:number_track]
        }
      end

      def validate_valid_audio_file
        begin
          raise Storage::InvalidAudioFormatError unless validates_format_music(data['music_file'].content_type)
        rescue
          raise Storage::AudioObligatoryError
        end
      end

      def validate_valid_image_file
        begin
          raise Storage::InvalidImageFormatError unless validates_format_image(data['image_cover'].content_type)
        rescue
          raise Storage::ImageObligatoryError
        end
      end
    end
  end
end