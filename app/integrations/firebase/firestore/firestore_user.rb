module Firebase
  module Firestore
    class FirestoreUser

      include Formatters::ResponseFormatter

      END_POINT = 'users/'.freeze

      attr_reader :firestore_base

      def initialize
        @firestore_base = FirestoreBase.new.firestore
      end

      def load_user(user_id)
        firestore_base.doc(mount_route(user_id)).get
      end

      def update_user(args, user_id)
        user_firestore = firestore_base.doc(mount_route(user_id))
        response = user_firestore.update(args)
        return success if response.update_time.present?

        fail(message: UserUpdateError)
      end

      private

      def mount_route(params)
        END_POINT + params
      end

    end
  end
end