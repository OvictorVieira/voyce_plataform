module Firebase
  module Firestore
    class FirestoreBase

      PRODUCTION_PROJECT_KEY = 'project_id'.freeze

      attr_reader :firestore

      def initialize
        @firestore = create_firestore_connection
      end

      protected

      def create_firestore_connection
        begin
          Google::Cloud::Firestore.new(project_id: load_project_id)
        rescue
          Firebase::Firestore::CommunicationHandler
        end
      end

      def load_project_id
        Rails.application.config.app.firebase.firestore.project_id
      end

    end
  end
end