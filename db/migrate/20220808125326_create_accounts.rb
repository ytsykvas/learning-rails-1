class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :label
      t.string :iban
      t.string :currency
      t.decimal :currency_balance
      t.integer :external_id

      t.timestamps
    end
  end
end
