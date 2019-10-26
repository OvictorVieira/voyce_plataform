class Dashboard::HomeController < ApplicationController

  def index
    begin
      music_service = Firebase::Firestore::MusicService.new(user_id: current_user[:id])
      goal_service = Firebase::Firestore::GoalService.new(user_id: current_user[:id])
      all_songs = music_service.load_all_songs
      goals = goal_service.load_all_goals

      @goals = goals[:goals]
      @albuns = all_songs[:albuns]
      @singles = all_songs[:singles]
    rescue =>  error
      flash[:danger] = error.message
    end
  end

  def sign_out
    reset_session

    redirect_to guest_auth_login_path
  end

end
