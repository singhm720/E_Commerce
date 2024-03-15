require 'rqrcode'
class PaymentsController < ApplicationController
  def show
     # Assuming you have payment details stored in a variable named @payment
    # Replace this with your actual payment details
    @payment_details = "Payment details here"

    # Generate the QR code
    @qr_code = RQRCode::QRCode.new(@payment_details)
  end
end
