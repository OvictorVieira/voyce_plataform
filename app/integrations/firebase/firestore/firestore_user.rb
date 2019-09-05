module Firebase
  module Firestore
    class FirestoreUser

      END_POINT = 'users/'.freeze

      attr_reader :firestore_base

      def initialize
        @firestore_base = Firebase::Firestore::FirestoreBase.new.firestore
      end

      def load_user(user_id)
        firestore_base.doc(mount_route(user_id)).get
      end

      private

      def mount_route(params)
        END_POINT + params
      end

    end
  end
end