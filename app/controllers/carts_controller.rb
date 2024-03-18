require 'rqrcode'
class CartsController < ApplicationController
  
  def add_to_cart
    @product = Product.find(params[:product_id])
    session[:cart] ||= []

    if session[:cart].include?(@product.id)
      flash[:alert] = "Product already present in cart."
    else
      # Increment cart count
      session[:cart_count] ||= 0
      session[:cart_count] += 1
  
      # Stored product in cart
      session[:cart] << @product.id
      flash[:notice] = "Product successfully added to cart."
    end
    redirect_to :root
  end

  
  def cart_items
    if session[:cart].present?
      @products = Product.where(id: session[:cart])
      @cart_items = @products.map { |product| { product: product, order_count: session[:cart].count(product.id) } }
      @subtotal = @cart_items.sum { |item| item[:product].title_price * item[:order_count] }
    else
      @products = []
      @cart_items = []
      @subtotal = 0
    end
  end

  
  
  

  def update_order_count
    @product = Product.find(params[:product_id])
    new_order_count = params[:order_count].to_i
    session[:cart_count] += new_order_count - session[:cart].count(@product.id)
    session[:cart] = session[:cart].reject { |id| id == @product.id } + [@product.id] * new_order_count
  
    @products = Product.where(id: session[:cart])
    @cart_items = @products.map { |product| { product: product, order_count: session[:cart].count(product.id) } }
    @subtotal = @cart_items.sum { |item| item[:product].title_price * item[:order_count] }
  
    respond_to do |format|
      format.js # This will render update_order_count.js.erb
    end
  end
  

def buy_now
    @product = Product.find(params[:product_id])
    @qr_code_url = generate_qr_code_url(@product)
end

def remove_item_from_cart
  product_id = params[:product_id].to_i
  begin
    session[:cart].delete(product_id)
    session[:cart_count] -= 1
    redirect_to cart_items_path, notice: 'Product removed from cart successfully.'
  rescue => e
    Rails.logger.error "Error removing product from cart: #{e.message}"
    redirect_to cart_items_path, alert: 'An error occurred while removing the product from the cart.'
  end
end


  private
  def generate_qr_code_url(product, scale: 8)
    recipient = '7208791386k@ybl'
    product_price = @product.title_price

    payment_data = "upi://pay?pa=#{recipient}&pn=Recipient Name&am=#{product_price}&cu=INR"

    qr_code = RQRCode::QRCode.new(payment_data)
    qr_code.as_svg(module_size: scale).html_safe
  end
end
  