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
#  icon             :string
#  icon_type        :string
#  icon_color       :string
#  bg_color         :string
#
class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :transaction_type, :order, :icon, :icon_type, :icon_color, :bg_color
end
