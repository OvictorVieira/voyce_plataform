class Dashboard::GoalsController < ApplicationController

  def index
    begin
      goal_service = Firebase::Firestore::GoalService.new(user_id: current_user[:id])
      goals = goal_service.load_all_goals

      @goals = goals[:goals]
    rescue =>  error
      flash[:danger] = error.message
    end
  end

  def new
  end

  def create
    begin
      allowed_parameters = filter_params
      allowed_parameters.merge!(user_id: current_user[:id])
      goal_service = Firebase::Firestore::GoalService.new(allowed_parameters)
      goal_service.process_creation

      flash[:success] = I18n.t('dashboard.goals.success.success_on_create')
    rescue =>  error
      flash[:danger] = error.message
    end

    redirect_to dashboard_goals_url
  end

  def edit
    begin
      params_proposal = { goal_id: params[:id], user_id: current_user[:id] }
      goal_service = Firebase::Firestore::GoalService.new(params_proposal)
      @goal = goal_service.load_goal
    rescue =>  error
      flash[:danger] = error.message
    end
  end

  def update
    begin
      allowed_parameters = filter_params
      allowed_parameters.merge!(user_id: current_user[:id])
      goal_service = Firebase::Firestore::GoalService.new(allowed_parameters)
      goal_service.process_update

      flash[:success] = I18n.t('dashboard.goals.success.success_on_update')
    rescue =>  error
      flash[:danger] = error.message
    end

    redirect_to dashboard_goals_url
  end

  private

  def filter_params
    params.permit(:price, :description, :goal_id)
  end
end
