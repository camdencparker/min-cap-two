class SuppliersController < ApplicationController
  def index
    suppliers = Supplier.all
    render json: suppliers
  end

  def create
    supplier = Supplier.new(
      name: params[:name],
      email: params[:email],
      phone_number: params[:phone_number]
    )
    if supplier.save
      render json: supplier
    else
      render json: {errors: supplier.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
