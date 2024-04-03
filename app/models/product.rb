require 'google/cloud/storage'
class Product < ApplicationRecord
    has_one_attached :image
    after_create :upload_image_to_gcs
   
    
    validates :title_name, presence: true, length: { maximum: 255 }
    validates :title_description, presence: true
    validates :title_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :image, presence: true

    private
    def upload_image_to_gcs
        # if image.attached? && image.blob.present?
        #   self.image = Rails.application.routes.url_helpers.url_for(image)
          save
        # end
    end
end
