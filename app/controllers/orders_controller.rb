class OrdersController < ApplicationController
  def index
    berfore_action :authenticate_user
    if current_user
      order = current_user.orders
      render json: order
    else
      render json: {}, status: :unauthorized
    end
    
  end


  def create
    if current_user
      product = Product.find(params[:product_id])
      subtotal = product.price * params[:quantity]
      tax = subtotal * 0.09
      total = subtotal + tax 
      order = Order.new(
        product_id: params[:product_id],
        user_id: current_user.id,
        quantity: params[:quantity],
        subtotal: subtotal,
        tax: tax,
        total: total)
      order.save
      render json: order
    else
      render json: [], status: :unauthorized
    end

  end
  
  def show
    if current_user 
      order = current_user.orders.find(params[:id])
      render json: order
    else
      render json: {}, status: :unauthorized
    end
  end
end
