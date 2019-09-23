class Dashboard::ProposalsController < ApplicationController

  def index
    begin
      proposal_service = Firebase::Firestore::ProposalService.new(user_id: current_user[:id])
      @all_proposals = proposal_service.load_all_proposals
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
      proposal_service = Firebase::Firestore::ProposalService.new(allowed_parameters)
      proposal_service.process_creation

      flash[:success] = I18n.t('dashboard.proposals.messages.success_on_create')
    rescue =>  error
      flash[:danger] = error.message
    end

    redirect_to dashboard_proposals_url
  end

  def edit
    begin
      params_proposal = { proposal_id: params[:id], user_id: current_user[:id] }
      proposal_service = Firebase::Firestore::ProposalService.new(params_proposal)
      @proposal = proposal_service.load_proposal
    rescue =>  error
      flash[:danger] = error.message
    end
  end

  def update
    begin
      allowed_parameters = filter_params
      allowed_parameters.merge!(user_id: current_user[:id])
      proposal_service = Firebase::Firestore::ProposalService.new(allowed_parameters)
      proposal_service.process_update
      flash[:success] = I18n.t('dashboard.proposals.messages.success_on_update')
    rescue =>  error
      flash[:danger] = error.message
    end

    redirect_to dashboard_proposals_url
  end

  private

  def filter_params
    params.permit(:proposal_name, :price, :description, :proposal_id, :proposal_image)
  end

end
