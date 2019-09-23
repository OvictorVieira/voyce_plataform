module Firebase
  module Storage
    class SaveImageError < StandardError

      def initialize
        super(I18n.t('dashboard.proposals.errors.save_image_error'))
      end
    end
  end
end