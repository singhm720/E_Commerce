class User < ApplicationRecord
  has_many :purchase_records
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # before_create :generate_verification_token

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
        validates :name, presence: true
        validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
        validates :mobile_number, presence: true, format: { with: /\A\d{10}\z/, message: "must be a 10-digit number" }
        validates :password, presence: true, length: { minimum: 6 }, confirmation: true, on: :create
        validates :password, length: { minimum: 6 }, confirmation: true, allow_blank: true, on: :update

        # private
        # def generate_verification_token
          # self.verification_token = SecureRandom.urlsafe_base64
        # end
end