class OrderSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :subtotal, 
end
