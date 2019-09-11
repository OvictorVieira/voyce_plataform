class Dashboard::HomeController < ApplicationController

  def index
    begin
      music_service = Firebase::Firestore::MusicService.new(user_id: current_user[:id])
      all_songs = music_service.load_all_songs
      @singles_and_albuns = all_songs.except(:success)
    rescue =>  error
      flash[:danger] = error.message
    end
  end

end
