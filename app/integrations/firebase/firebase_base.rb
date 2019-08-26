module Firebase
  class FirebaseBase

    BASE_URI_PROD = "https://voyce-5e1c3.firebaseio.com/".freeze

    attr_reader :firebase

    def initialize
      private_key_json_string = load_private_firebase_content.to_s
      @firebase = Firebase::Client.new(BASE_URI_PROD, private_key_json_string)
    end

    protected

    def load_content(key)
      private_firebase_content = JSON.parse(load_private_firebase_content)
      private_firebase_content[key]
    end

    def load_private_firebase_content
      Rails.application.config.app.firebase.private_key
    end

  end
end