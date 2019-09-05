module Formatters
  module ResponseFormatter

    attr_accessor :response

    def success(**args)
      {
        success: true
      }.merge! args
    end

    def fail(**args)
      {
        success: false
      }.merge! args
    end
  end
end