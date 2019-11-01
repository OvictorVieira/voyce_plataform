module Firebase
  module Firestore
    class UserService

      attr_reader :user_repository, :data

      def initialize(args)
        @data = args
        @user_repository = UserRepository.new
      end

      def access_account
        email = data[:email]
        password = data[:password]
        firebase_user = user_repository.access_account(email, password)
        raise_exception(firebase_user[:message]) unless firebase_user[:success]

        firebase_user[:user_data]
      end

      def transform_listener_in_artist
        formatted_data = format_data_to_update
        firestore_response = user_repository.transform_listener_in_artist(formatted_data, data[:user_id])
        raise_exception(firestore_response[:message]) unless firestore_response[:success]

        firestore_response
      end

      def update_user
        formatted_data = format_data_to_update
        firestore_response = user_repository.update_user_data(formatted_data, data[:user_id])
        raise_exception(firestore_response[:message]) unless firestore_response[:success]

        firestore_response
      end

      private

      def format_data_to_update
        {
          biography: data['about_me'],
          city: data['city'],
          email: data['email'],
          facebook_url: data['facebook_link'],
          gender: data['select_gender'].to_i,
          instagram_url: data['instagram_link'],
          name: data['username'],
          phone_number: data['phone_number'],
          state: data['state'],
          twitter_url: data['twitter_link'],
          complete_name: data['complete_name'],
          image: UserRepository::DEFAULT_IMAGE_URL,
          accepted_terms: true
        }
      end

      def raise_exception(message)
        raise message
      end
    end
  end
end