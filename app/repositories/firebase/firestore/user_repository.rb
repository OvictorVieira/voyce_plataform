module Firebase
  module Firestore
    class UserRepository

      GENDER_MALE = 0
      GENDER_FEMALE = 1
      GENDER_NOT_TO_SAY = 2
      LISTENER_TYPE = 0
      ARTIST_TYPE = 1

      GENDERS = [
        I18n.t('dashboard.user_to_artist.buttons.male'),
        I18n.t('dashboard.user_to_artist.buttons.female'),
        I18n.t('dashboard.user_to_artist.buttons.prefer_not_to_say')
      ]

      attr_accessor :firebase_communicator_user, :firestore_user

      def initialize
        @firestore_user = FirestoreUser.new
        @firebase_communicator_user = CommunicationUser.new
      end

      def access_account(email, password)
        firebase_communicator_user.login_on_firebase(email, password)
      end

      def transform_listener_in_artist(args, user_id)
        args.merge!(type: ARTIST_TYPE)
        firestore_user.update_user(args, user_id)
      end

      def update_user_data(args, user_id)
        firestore_user.update_user(args, user_id)
      end
    end
  end
end