module Firebase
  module Firestore
    class UserUpdateError < StandardError

      def initialize
        super(I18n.t('dashboard.users.errors.update'))
      end
    end
  end
end