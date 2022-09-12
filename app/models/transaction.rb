# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :account

  validates :account_id, presence: true
  validates :external_id, presence: true
  validates :currency, acceptance: { accept: ['EU', 'USD'] }, presence: true
  validates :currency_balance, presence: true
  validates :label, presence: true
  validates :transaction_type, presence: true
end
