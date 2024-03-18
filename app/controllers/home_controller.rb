class HomeController < ApplicationController
    def index
      @products = 
      if params[:query].present?
        Product.where("title_name LIKE ?", "%#{params[:query]}%")
        .or(Product.where("title_description LIKE ?", "%#{params[:query]}%"))
    else          
        Product.all
    end
    end
  end
  