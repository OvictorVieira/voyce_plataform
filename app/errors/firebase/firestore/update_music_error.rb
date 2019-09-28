module Firebase
  module Firestore
    class UpdateMusicError < StandardError

      def initialize
        super(I18n.t('dashboard.musics.messages.error.update_music_error'))
      end
    end
  end
end