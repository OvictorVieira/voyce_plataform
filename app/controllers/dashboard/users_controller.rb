class Dashboard::UsersController < ApplicationController

  def edit
  end

  def update
    begin
      allowed_parameters = filter_params
      allowed_parameters.merge!(user_id: current_user[:id])

      'fazer os metodos de atualização'
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
