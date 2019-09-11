module Firebase
  module Firestore
    class MusicRepository

      MUSIC_STATUSES = [
        I18n.t('dashboard.music.statuses.pending_review'),
        I18n.t('dashboard.music.statuses.in_review'),
        I18n.t('dashboard.music.statuses.approved'),
        I18n.t('dashboard.music.statuses.disapproved')
      ]

      attr_accessor :firestore_music

      def initialize
        @firestore_music = FirestoreMusic.new
      end

      def load_all_songs(user_id)
        firestore_music.load_all_songs(user_id)
      end
    end
  end
end