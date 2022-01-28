class CartedProductsController < ApplicationController

  def create
    if current_user
      carted_product = CartedProduct.new(
        user_id: params[:user_id],
        product_id: params[:product_id],
        quantity: params[:quantity],
      )
      carted_product.save
      render json: carted_product
    else
      render json: render json: {errors: product.errors.full_messages}, status: :unprocessable_entity
    end
  end
     
end
