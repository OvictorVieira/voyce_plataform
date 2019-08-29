module Firebase
  class FirebaseBase

    BASE_URI_PROD = "https://voyce-5e1c3.firebaseio.com/".freeze

    attr_reader :firebase

    def initialize
      @firebase = create_firebase_connection
    end

    protected

    def create_firebase_connection
      private_key_json_string = load_private_firebase_content.to_s
      response = Firebase::Client.new(BASE_URI_PROD, private_key_json_string)
      raise Firebase::CommunicationHandler unless response.success?
      response
    end

    def load_content(key)
      private_firebase_content = JSON.parse(load_private_firebase_content)
      private_firebase_content[key]
    end

    def load_private_firebase_content
      Rails.application.config.app.firebase.private_key
    end

  end
end