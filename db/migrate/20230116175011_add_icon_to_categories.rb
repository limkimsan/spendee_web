class AddIconToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :icon, :string
    add_column :categories, :icon_type, :string
    add_column :categories, :icon_color, :string
    add_column :categories, :bg_color, :string
  end
end
