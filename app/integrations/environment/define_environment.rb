module Environment
  class DefineEnvironment
    class << self

      def is_development?
        Rails.env.development? || Rails.env.test?
      end

    end
  end
end