class CreateCategory < ActiveRecord::Migration[7.0]
  def change
    create_table :categories, id: :uuid do |t|
      t.string :name
      t.integer :transaction_type
      t.integer :order
      t.timestamps
    end
  end
end
