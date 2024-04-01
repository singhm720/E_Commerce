class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def show_orders
    @purchase_records = current_user.purchase_records.includes(:product)
  end

  def new
    @purchase_record = PurchaseRecord.new
  end

  def create
    order_id = Time.now.strftime("%Y%m%d%H%M%S") + SecureRandom.hex(4)
    @user = current_user

    if params[:from_cart] == 'true' && session[:cart].present?
      session[:cart].each do |product_id|
        product = Product.find(product_id)
        purchase_record = @user.purchase_records.build(
          product: product,
          user_email: @user.email,
          user_name: @user.name,
          order_id: order_id,
          transaction_id: params[:transaction_id],
          product_name: product.title_name,
          product_price: product.title_price,
          total_cart_price: session[:subtotal]
        )
        
        unless purchase_record.save
          flash[:error] = "Failed to create purchase record for product #{product_id}."
          redirect_to root_path and return
        end
      end
      
      # After processing all cart items, delete cart from session
      session.delete(:cart)
      session.delete(:cart_count)
    else
        @product = Product.find(params[:product_id])
        @purchase_record = current_user.purchase_records.build(
          product: @product,
          user_email: current_user.email,
          user_name: current_user.name,
          order_id: order_id,
          transaction_id: params[:transaction_id],
          product_name: @product.title_name,
          product_price: @product.title_price,
          total_cart_price: @product.title_price
        )
    end

    if @purchase_record.save
      redirect_to @purchase_record, notice: "Product purchased successfully."
    else
      redirect_to @purchase_record, notice: "Fatt gaya BC."
    end
  end
end
