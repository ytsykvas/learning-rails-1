# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :account_id
      t.integer :external_id
      t.string :currency
      t.decimal :currency_balance
      t.string :label
      t.string :transaction_type

      t.timestamps
    end
  end
end
