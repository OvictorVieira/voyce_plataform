module Firebase
  module Firestore
    class GetMusicsError < StandardError

      def initialize
        super(I18n.t('dashboard.users.messages.errors.get_musics'))
      end
    end
  end
end