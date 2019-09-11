module Firebase
  module Firestore
    module FirebaseResponseStatuses

      EMAIL_NOT_FOUND_STATUS = 'EMAIL_NOT_FOUND'.freeze
      INVALID_PASSWORD_STATUS = 'INVALID_PASSWORD'.freeze
      USER_DISABLED_STATUS = 'USER_DISABLED'.freeze

      FIREBASE_ERROR_STATUSES = {
        EMAIL_NOT_FOUND_STATUS => SingUpError,
        INVALID_PASSWORD_STATUS => SingUpError,
        USER_DISABLED_STATUS => UserDisabledError
      }
    end
  end
end