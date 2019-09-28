module Firebase
  module Storage
    class AudioObligatoryError < StandardError

      def initialize
        super(I18n.t('dashboard.musics.messages.error.audio_obligatory'))
      end
    end
  end
end