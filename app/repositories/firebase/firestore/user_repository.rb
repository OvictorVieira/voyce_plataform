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

      DEFAULT_IMAGE_URL = 'https://firebasestorage.googleapis.com/v0/b/voyce2-dcae6.appspot.com/o/profile_images%2Fdefault-user-image-profile.jpeg?alt=media&token=86598e91-49bb-4ebf-87a3-d3e3397df1c1'.freeze

      attr_accessor :user_firebase_communicator, :user_firestore

      def initialize
        @user_firestore = UserFirestore.new
        @user_firebase_communicator = UserCommunication.new
      end

      def access_account(email, password)
        user_firebase_communicator.login_on_firebase(email, password)
      end

      def transform_listener_in_artist(args, user_id)
        args.merge!(type: ARTIST_TYPE)
        user_firestore.update_user(args, user_id)
      end

      def update_user_data(args, user_id)
        user_firestore.update_user(args, user_id)
      end
    end
  end
end