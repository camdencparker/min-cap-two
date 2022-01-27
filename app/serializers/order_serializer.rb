class OrderSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :subtotal

  belongs_to :product
  belongs_to :user
end
