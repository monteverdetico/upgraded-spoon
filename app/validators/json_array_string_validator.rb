# frozen_string_literal: true

class JsonArrayStringValidator < ActiveModel::Validator
  ERROR_MSG = 'must be a valid JSON Array.'

  def validate(record)
    result = JSON.parse(record.ingredients)
    return if result.is_a?(Array)

    record.errors.add(:ingredients, ERROR_MSG)
  rescue JSON::ParserError
    record.errors.add(:ingredients, ERROR_MSG)
  end
end
