module Firebase
  module Firestore
    class SingUpError < StandardError

      def initialize
        super(I18n.t('firebase.firestore.errors.signup_error'))
      end
    end
  end
end