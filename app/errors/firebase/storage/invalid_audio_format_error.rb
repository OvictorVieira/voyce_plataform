module Firebase
  module Storage
    class InvalidAudioFormatError < StandardError

      def initialize
        super(I18n.t('dashboard.musics.messages.error.invalid_format_audio'))
      end
    end
  end
end