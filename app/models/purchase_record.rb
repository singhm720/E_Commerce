class PurchaseRecord < ApplicationRecord
    validates :user_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :user_name, presence: true
    validates :product_id, presence: true
    validates :product_name, presence: true
    validates :product_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :total_cart_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :transaction_id, presence: true, uniqueness: true
end
