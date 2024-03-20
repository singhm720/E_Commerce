class PurchaseRecordsController < ApplicationController
    def new
      @purchase_record = PurchaseRecord.new
    end
  
    def create
      @purchase_record = PurchaseRecord.new(purchase_record_params)
      if @purchase_record.save
        redirect_to @purchase_record, notice: "Purchase record was successfully created."
      else
        render :new
      end
    end

    private
    def purchase_record_params
        params.require(:purchase_record).permit(:user_name, :product_id, :product_name, :product_price, :total_cart_price, :transaction_id)
        .merge(user_email: current_user.email)
      end      
  end
  