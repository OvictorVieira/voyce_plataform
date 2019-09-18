module Firebase
  module Firestore
    class ProposalFirestore

      include Formatters::ResponseFormatter

      USER_END_POINT = 'users'.freeze
      USER_PROPOSALS_END_POINT = 'user_proposals'.freeze
      END_POINT = 'proposals'.freeze

      attr_reader :firestore_base

      def initialize
        @firestore_base = FirestoreBase.new.firestore
      end

      def load_proposal(user_id, proposal_id)
        begin
          proposal = get_proposal(user_id, proposal_id)
          success(proposal: proposal)
        rescue => error
          fail(message: GetProposalError, error: error.message)
        end
      end

      def load_all_proposals(user_id)
        begin
          proposals = load_proposals_path(USER_END_POINT, user_id, END_POINT).get
          success(proposals: proposals)
        rescue => error
          fail(message: GetProposalError, error: error.message)
        end
      end

      def process_creation_proposal(user_id, data)
        begin
          user_proposal = c_proposal_on_user(user_id, data)
          c_proposal_on_user_proposals(user_id, data, user_proposal.document_id)
          success(response: response)
        rescue => error
          fail(message: CreateProposalError, error: error.message)
        end
      end

      def process_update_proposal(user_id, data)
        begin
          update_proposal_on_user(user_id, data)
          update_proposal_user_proposals(user_id, data)
          success(response: response)
        rescue => error
          fail(message: UpdateProposalError, error: error.message)
        end
      end

      private

      def get_proposal(user_id, proposal_id)
        load_proposals_path(USER_END_POINT, user_id, END_POINT).doc(proposal_id).get
      end

      def c_proposal_on_user(user_id, data)
        load_proposals_path(USER_END_POINT, user_id, END_POINT).add(data)
      end

      def c_proposal_on_user_proposals(user_id, data, user_proposal_id)
        load_proposals_path(USER_PROPOSALS_END_POINT, user_id, END_POINT).doc(user_proposal_id).set(data)
      end

      def update_proposal_on_user(user_id, data)
        load_proposals_path(USER_END_POINT, user_id, END_POINT).doc(data[:proposal_id])
                                                               .update(data)
      end

      def update_proposal_user_proposals(user_id, data)
        load_proposals_path(USER_PROPOSALS_END_POINT, user_id, END_POINT).doc(data[:proposal_id])
                                                                         .update(data)
      end

      def load_proposals_path(col_name, doc_name, child_col_name)
        firestore_base.col(col_name).doc(doc_name).col(child_col_name)
      end

    end
  end
end