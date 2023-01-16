class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :transaction_type, :order
end
