class Dashboard::HomeController < ApplicationController

  def index
  end

  def convert_user_to_artist
    begin
      allowed_parameters = filter_params
      allowed_parameters.merge!(user_id: current_user[:id])
      user_service = Firebase::Firestore::UserService.new(allowed_parameters)
      user_service.transform_listener_in_artist
    rescue => error
      flash[:danger] = error.message
    end

    redirect_to dashboard_url
  end

  private

  def filter_params
    params.permit(:username, :email, :complete_name, :phone_number, :select_gender,
                  :facebook_link, :instagram_link, :twitter_link, :city, :state, :about_me)
  end
end
