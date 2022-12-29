module V1
  module Exceptions
    class Error < RuntimeError
      attr_reader :status

      def to_json(_options = {})
        { errors: }.to_json
      end
    end
  end
end