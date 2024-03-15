class Product < ApplicationRecord
    has_one_attached :image

    validates :title_name, presence: true, length: { maximum: 255 }
    validates :title_description, presence: true
    validates :title_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :image, presence: true
end
