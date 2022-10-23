class CreateTransaction < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.float :amount
      t.integer :currency_type
      t.string :note
      t.integer :transaction_type
      t.date :transaction_date
      t.integer :user_id
      t.integer :category_id
      t.timestamps
    end
  end
end
