class Dashboard::HomeController < ApplicationController

  def index
    begin
      music_service = Firebase::Firestore::MusicService.new(user_id: current_user[:id])
      all_songs = music_service.load_all_songs
      @singles = all_songs[:singles]
      @albuns = all_songs[:albuns]
    rescue =>  error
      flash[:danger] = error.message
    end
  end

  def sign_out
    reset_session

    redirect_to guest_auth_login_path
  end

end
