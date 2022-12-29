module V1
  module Exceptions
    class RecordInvalidError < Error
      def initialize(record)
        @record = record
        @status = 422
      end

      def errors
        return @errros if @errors

        @errors = []
        @record.errors.each do |attr_key, message|
          @errors << json_api_error(attr_key, message)
        end

        @errors
      end

      private
      def json_api_error(attr_key, message)
        V1::Error.new(
          code: status,
          status: :unprocessable_entity,
          title: message,
          detail: "#{attr_key} - #{message}",
          source: { pointer: pointer(attr_key) }
        )
      end

      def pointer
        "/data/attributes/#{attr_key}"
      end
    end
  end
end