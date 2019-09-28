module Firebase
  module Storage
    class SaveMusicError < StandardError

      def initialize
        super(I18n.t('dashboard.musics.messages.error.save_music_error'))
      end
    end
  end
end