class CreateCategory < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :type
      t.integer :order, auto_increment: true
      t.timestamps
    end
  end
end
