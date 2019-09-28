module Firebase
  module Firestore
    class MusicRepository

      MUSIC_STATUSES = [
        I18n.t('dashboard.musics.statuses.pending_review'),
        I18n.t('dashboard.musics.statuses.in_review'),
        I18n.t('dashboard.musics.statuses.disapproved'),
        I18n.t('dashboard.musics.statuses.approved')
      ]

      STATUS_PENDING_REVIEW = 0
      STATUS_IN_REVIEW = 1
      STATUS_DISAPPROVED = 2
      STATUS_APPROVED = 3

      attr_accessor :music_firestore, :music_storage

      def initialize
        @music_firestore = MusicFirestore.new
        @music_storage = Storage::MusicStorage.new
      end

      def load_all_songs(user_id)
        music_firestore.load_all_songs(user_id)
      end

      def load_song(user_id, music_id)
        music_firestore.load_song(user_id, music_id)
      end

      def save_music_on_storage(music, user_id)
        music_storage.save_music_on_storage(music, user_id)
      end

      def save_image_on_storage(image, user_id)
        music_storage.save_image_on_storage(image, user_id)
      end

      def create_music(user_id, fields)
        music_firestore.create_music(user_id, fields)
      end

      def update_music(user_id, music_id, data)
        music_firestore.update_music(user_id, music_id, data)
      end
    end
  end
end