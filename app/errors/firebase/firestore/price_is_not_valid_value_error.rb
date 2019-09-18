module Firebase
  module Firestore
    class PriceIsNotValidValueError < StandardError

      def initialize
        super(I18n.t('dashboard.proposals.errors.invalid_price'))
      end
    end
  end
end