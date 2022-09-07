# frozen_string_literal: true

class RemoveCurrencyFromAccounts < ActiveRecord::Migration[7.0]
  def change
    remove_column :accounts, :currency, :string
  end
end
