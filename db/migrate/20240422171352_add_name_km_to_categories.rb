class AddNameKmToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :name_km, :string
  end
end
