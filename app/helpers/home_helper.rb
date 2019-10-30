module HomeHelper

  def load_music_status(status)
    Firebase::Firestore::MusicRepository::MUSIC_STATUSES[status]
  end

  def load_music_status_icon(status)
    %w(warning info danger success)[status]
  end

  def load_first_goal
    value = @goals.first.present? ? @goals.first.data[:price] : nil
    format_currency_br(value)
  end

end
