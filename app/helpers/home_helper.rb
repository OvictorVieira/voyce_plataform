module HomeHelper

  def is_only_listener?
    current_user[:type] == Firebase::Firestore::UserRepository::LISTENER_TYPE
  end
end
