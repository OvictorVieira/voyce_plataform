class ApplicationController < ActionController::Base

  before_action :authenticate_user!

  helper_method :current_user

  def authenticate_user!
    unless current_user.present? && session[:user_id].present?
      flash[:danger] = I18n.t('authentication.failure.unauthenticated')
      redirect_to guest_auth_login_url
    end
  end

  def user_session(firebase_user_id)
    session[:user_id] = firebase_user_id
  end

  def is_logged?
    current_user.present?
  end

  def reset_session
    @_request.reset_session
  end

  private

  def current_user
    @current_user ||= load_current_user if session[:user_id].present?
  end

  def load_current_user
    firestore_user = Firebase::Firestore::UserFirestore.new
    firestore_user.load_user(session[:user_id])
  end

end
