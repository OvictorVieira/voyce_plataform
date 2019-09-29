module Firebase
  module Firestore
    module RepositoryBase

      def raise_exception(message)
        raise message
      end

      def create_public_urls(object)
        url = object.self_link.gsub(FirestoreBase::FIRESTORE_PRIVATE_URL_BASE,
                                    FirestoreBase::FIRESTORE_URL_BASE_BUCKET)
        url << FirestoreBase::FIRESTORE_URL_ALT_MEDIA
      end
    end
  end
end