module Firebase
  module Storage
    class InvalidImageFormatError < StandardError

      def initialize
        super(I18n.t('dashboard.proposals.errors.invalid_format_image'))
      end
    end
  end
end