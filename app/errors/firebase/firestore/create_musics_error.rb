module Firebase
  module Firestore
    class CreateMusicsError < StandardError

      def initialize
        super(I18n.t('dashboard.musics.messages.error.create_music_error'))
      end
    end
  end
end