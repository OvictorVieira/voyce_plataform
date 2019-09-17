module ProposalsHelper

  def load_proposal_status(status)
    Firebase::Firestore::ProposalRepository::PROPOSAL_STATUSES[status]
  end
end
