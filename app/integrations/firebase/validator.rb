module Firebase
  module Validator

    VALID_IMAGES_FORMATS = %w(image/jpg image/jpeg image/JPG image/JPEG image/png image/PNG)

    def verify_fields_are_present(fields)
      fields.each { |field| return false unless field.present? }
    end

    def valid_float?(value)
      Float(value.gsub(',', '.'))
    end

    def validates_format_image(content_type)
      VALID_IMAGES_FORMATS.include? content_type
    end
  end
end