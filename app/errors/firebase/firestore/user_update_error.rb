module Firebase
  module Firestore
    class UserUpdateError < StandardError

      def initialize
        super(I18n.t('dashboard.users.messages.errors.update'))
      end
    end
  end
end