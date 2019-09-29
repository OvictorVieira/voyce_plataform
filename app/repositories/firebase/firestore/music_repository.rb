module Firebase
  module Firestore
    class MusicRepository

      MUSIC_STATUSES = [
        I18n.t('dashboard.music.statuses.pending_review'),
        I18n.t('dashboard.music.statuses.in_review'),
        I18n.t('dashboard.music.statuses.approved'),
        I18n.t('dashboard.music.statuses.disapproved')
      ]

      attr_accessor :music_firestore

      def initialize
        @music_firestore = MusicFirestore.new
      end

      def load_all_songs(user_id)
        music_firestore.load_all_songs(user_id)
      end
    end
  end
end