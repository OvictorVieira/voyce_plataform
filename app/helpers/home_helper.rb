module HomeHelper

  def load_music_status(status)
    Firebase::Firestore::MusicRepository::MUSIC_STATUSES[status]
  end

  def load_music_status_icon(status)
    %w(warning info danger success)[status]
  end
end
