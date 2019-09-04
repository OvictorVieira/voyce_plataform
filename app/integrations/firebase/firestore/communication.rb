module Firebase
  module Firestore
    class Communication

      include HTTParty
      include Formatters::ResponseFormatter
      include Firebase::Firestore::FirebaseResponseStatuses

      URL_BASE = 'https://identitytoolkit.googleapis.com/v1/accounts:'.freeze
      API_KEY_PARAM = '?key='.freeze
      CONTENT_TYPE_JSON = 'application/json'.freeze

      attr_reader :end_point, :error_message

      def initialize(end_point)
        @end_point = end_point
      end

      def get
      end

      def post(body)
        begin
          response = self.class.post(mount_end_point, body: body.to_json, headers: mount_headers)
          response_analyser(response['error']['errors']) if response['error'].present?

          success(user_data: response)
        rescue => error
          fail(message: error.message)
        end
      end

      def put(body)
      end

      def delete(body)
      end

      private

      def mount_end_point
        URL_BASE + end_point + API_KEY_PARAM + load_api_key
      end

      def load_api_key
        Rails.application.config.app.firebase.firestore.api_key
      end

      def mount_headers(args = {})
        {
          'content-type': CONTENT_TYPE_JSON
        }.merge!(args)
      end

      def response_analyser(errors)
        error_code = errors.first['message']
        @error_message = FIREBASE_ERROR_STATUSES[error_code] if FIREBASE_ERROR_STATUSES.include? error_code

        raise error_message if error_message.present?
      end
    end
  end
end