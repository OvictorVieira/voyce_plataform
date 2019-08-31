module Firebase
  module Firestore
    class FirestoreBase

      DEVELOPMENT_PROJECT_KEY = 'project_voyce'.freeze
      PRODUCTION_PROJECT_KEY = 'project_id'.freeze

      attr_reader :firestore

      def initialize
        @firestore = create_firestore_connection
      end

      protected

      def create_firestore_connection
        begin
          Google::Cloud::Firestore.new(project_id: load_project_id)
        rescue Firebase::CommunicationHandler => error
          error.message
        end
      end

      def load_project_id
        return DEVELOPMENT_PROJECT_KEY if Environment::DefineEnvironment.is_development?

        private_firestore_content = JSON.parse(load_private_firestore_content)
        private_firestore_content[PRODUCTION_PROJECT_KEY]
      end

      def load_private_firestore_content
        Rails.application.config.app.firebase.private_key
      end

    end
  end
end