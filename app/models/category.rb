# == Schema Information
#
# Table name: categories
#
#  id               :integer          not null, primary key
#  name             :string
#  transaction_type :integer
#  order            :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Category < ApplicationRecord
  validates :name, presence: true
  validates :transaction_type, presence: true

  enum transaction_type: {
    income: 0,
    expense: 1
  }

  # constant
  TRANSACTION_TYPES = [["Income", "income"], ["Expense", "expense"]]
end
