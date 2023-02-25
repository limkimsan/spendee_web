# == Schema Information
#
# Table name: transactions
#
#  id               :uuid             not null, primary key
#  amount           :float
#  currency_type    :integer
#  note             :string
#  transaction_type :integer
#  transaction_date :date
#  user_id          :uuid
#  category_id      :uuid
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :amount, presence: true
  validates :transaction_date, presence: true

  enum currency_type: {
    khr: 0,
    usd: 1
  }

  enum transaction_type: {
    income: 0,
    expense: 1
  }

  #constant
  CURRENCY_TYPES = [["Riel", "khr"], ["USD", "usd"]]
  TRANSACTION_TYPES = [["Income", "income"], ["Expense", "expense"]]
end
