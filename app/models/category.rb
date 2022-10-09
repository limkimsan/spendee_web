# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  type       :integer
#  order      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
  validates :name, presence: true
  validates :type, presence: true

  enum type: {
    income: 0,
    expense: 1
  }

  TYPES = [["Income", "income"], ["Expense", "expense"]]
end
