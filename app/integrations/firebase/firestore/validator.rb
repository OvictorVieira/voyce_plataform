module Firebase
  module Firestore
    module Validator

      def verify_fields_are_present(fields)

        fields.each do |field|
          return false unless field.present?
        end
      end

      def valid_float?(value)
        Float(value.gsub(',', '.'))
      end
    end
  end
end