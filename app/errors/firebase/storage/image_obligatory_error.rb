module Firebase
  module Storage
    class ImageObligatoryError < StandardError

      def initialize
        super(I18n.t('dashboard.proposals.errors.image_obligatory'))
      end
    end
  end
end