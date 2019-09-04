module Firebase
  module Firestore
    class FirestoreUser

      END_POINT = 'users/'.freeze

      attr_reader :firestore_user, :user_reference, :firestore

      def initialize
        @firestore = Firebase::Firestore::FirestoreBase.new.firestore
      end

      def load_user(user_id)
        @firestore_user = firestore.doc(mount_route(user_id))

      end

      private

      def mount_route(params)
        END_POINT + params
      end

    end
  end
end