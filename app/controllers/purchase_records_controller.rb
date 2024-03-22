class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def show_orders
    @purchase_records = PurchaseRecord.includes(:product)
      # purchase_records.each do |record|
      #   product = record.product
      # end
  end

  def new
    @purchase_record = PurchaseRecord.new
  end

  def create
    @product = Product.find(params[:product_id])
    @purchase_record = current_user.purchase_records.build(
      product: @product,
      user_email: current_user.email,
      user_name: current_user.name,
      transaction_id: params[:transaction_id],
      product_name: @product.title_name,
      product_price: @product.title_price,
      total_cart_price: @product.title_price

    )
    if @purchase_record.save
      redirect_to @purchase_record, notice: "Product purchased successfully."
    else
      # Handle validation errors or other errors
    end
  end
end
