# frozen_string_literal: true

require 'uri'

# Validator for urls
class UrlValidator < ActiveModel::EachValidator
  def self.compliant?(value)
    uri = URI.parse(value)
    uri.is_a?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
    false
  end

  def validate_each(record, attribute, value)
    record.errors.add(attribute, 'debe ser una URL válida') unless value.present? && self.class.compliant?(value)
  end
end
