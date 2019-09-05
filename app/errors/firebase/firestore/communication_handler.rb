module Firebase
  module Firestore
    class CommunicationHandler < StandardError

      def initialize
        super(I18n.t('firebase.firestore.errors.firebase_comunication_error'))
      end
    end
  end
end