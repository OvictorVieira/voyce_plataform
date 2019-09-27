module Firebase
  module Firestore
    class MusicFieldsNotPresentError < StandardError

      def initialize
        super(I18n.t('dashboard.musics.messages.error.invalid_fields'))
      end
    end
  end
end