# frozen_string_literal: true

require 'iban-tools'

class IbanValidator < ActiveModel::Validator
  def validate(record)
    record.errors.add :iban, record.errors.generate_message(:iban, :invalid) unless IBANTools::IBAN.valid?(record.iban)
  end
end
