module ErrorRaisable
  extend ActiveSupport::Concern

  def raise_record_invalid_error(record)
    raise RecordInvalidError.new(errors: record.errors.to_h)
  end
end