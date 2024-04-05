require 'google/cloud/storage'
class Product < ApplicationRecord
  # attr_accessor :image_file_name, :image_content_type, :image_file_size, :image_updated_at
  
  has_attached_file :image,
    styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    
    validates :title_name, presence: true, length: { maximum: 255 }
    validates :title_description, presence: true
    validates :title_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :image, presence: true
end
