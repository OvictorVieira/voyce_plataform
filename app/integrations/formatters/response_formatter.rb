module Formatters
  class ResponseFormatter

    attr_accessor :response

    def success(status, args)
      {
          success: status
      }.merge! args
    end

    def fail(status, args)
      {
          success: status
      }.merge! args
    end
  end
end