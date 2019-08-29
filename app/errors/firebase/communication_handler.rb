module Firebase
  class CommunicationHandler < StandardError

    def initialize
      super I18n.t('firebase.errors.login.firebase_comunication_error')
    end
  end
end