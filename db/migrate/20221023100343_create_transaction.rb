class CreateTransaction < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions, id: :uuid do |t|
      t.float :amount
      t.integer :currency_type
      t.string :note
      t.integer :transaction_type
      t.date :transaction_date
      t.uuid :user_id
      t.uuid :category_id
      t.timestamps
    end
  end
end
