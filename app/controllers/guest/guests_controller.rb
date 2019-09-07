class Guest::GuestsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :access_account]

  def index
    render_login_page
  end

  def access_account
    begin
      allowed_parameters = filter_params
      user_service = Firebase::Firestore::UserService.new(allowed_parameters)
      firebase_user = user_service.access_account
      user_session(firebase_user['localId'])
      current_user

      redirect_to dashboard_url
    rescue => error
      flash[:danger] = error.message
      render_login_page
    end
  end

  private

  def filter_params
    params.permit(:email, :password)
  end

  def render_login_page
    render 'guests/index'
  end
end
