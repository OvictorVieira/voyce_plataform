module HomeHelper

  def load_music_status(status)
    Firebase::Firestore::MusicRepository::MUSIC_STATUSES[status]
  end

end
