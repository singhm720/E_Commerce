require 'rqrcode'
class BuyNowController < ApplicationController
  
  def buy_now(cart_items = nil)
    @product = Product.find(params[:product_id])
    items = cart_items.nil? ? [@product] : cart_items.map { |item| item[:product] }
    @subtotal = items.sum { |item| item.title_price }
    @qr_code_url = generate_qr_code_url(@product, @subtotal)
  end

  private
  def generate_qr_code_url(products, total_price, scale: 4)
    recipient = '7208791386k@ybl'
    total_price = @product.title_price
    
    payment_data = "upi://pay?pa=#{recipient}&pn=Recipient Name&am=#{total_price}&cu=INR"
    
    qr_code = RQRCode::QRCode.new(payment_data)
    qr_code.as_svg(module_size: scale).html_safe
  end
end
