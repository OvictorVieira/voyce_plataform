module HomeHelper

  INITIAL_GOAL = 'R$ 0,00'.freeze

  def goal_value
    return number_to_currency_br(current_user[:goal][:value]) if current_user[:goal].present? && current_user[:goal][:value].present?

    INITIAL_GOAL
  end

  def goal_current_value
    return number_to_currency_br(current_user[:goal][:goal_current_value]) if current_user[:goal].present? && current_user[:goal][:goal_current_value].present?

    INITIAL_GOAL
  end

  def load_music_status(status)
    Firebase::Firestore::MusicRepository::MUSIC_STATUSES[status]
  end

end
