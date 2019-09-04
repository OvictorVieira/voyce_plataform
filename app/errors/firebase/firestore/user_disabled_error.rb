module Firebase
  module Firestore
    class UserDisabledError < StandardError

      def initialize
        super(I18n.t('firebase.firestore.errors.disabled_user'))
      end
    end
  end
end