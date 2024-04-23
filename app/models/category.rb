# == Schema Information
#
# Table name: categories
#
#  id               :uuid             not null, primary key
#  name             :string
#  transaction_type :integer
#  order            :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  icon             :string
#  icon_type        :string
#  icon_color       :string
#  bg_color         :string
#
class Category < ApplicationRecord
  validates :name, presence: true
  validates :transaction_type, presence: true
  validates :name_km, presence: true

  enum transaction_type: {
    income: 0,
    expense: 1
  }

  # constant
  TRANSACTION_TYPES = [["Income", "income"], ["Expense", "expense"]]
end
