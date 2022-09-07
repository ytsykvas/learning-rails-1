# frozen_string_literal: true

class RenameColumnInAccounts < ActiveRecord::Migration[7.0]
  def change
    rename_column :accounts, :currency_balance, :balance
  end
end
