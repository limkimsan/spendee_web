namespace :category do
  desc "migrate name_km for all categories"
  task migrate_name_km_for_all_categories: :environment do
    Category.all.each do |category|
      category.update_column(:name_km, category.name)
    end
  end
end