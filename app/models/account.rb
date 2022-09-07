# frozen_string_literal: true

class Account < ApplicationRecord
  has_many :transactions, dependent: :destroy
  validates :label, presence: true
  validates_with IbanValidator
  validates :iban, uniqueness: true, presence: true
  validates :balance, presence: true
  validates :external_id, presence: true
end
