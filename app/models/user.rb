class User < ActiveRecord::Base
  has_secure_password
	validates_presence_of :first_name, :last_name, :email
	
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
	validates :first_name, :last_name, length: { in: 2..20 }
	
	has_many :products
	has_many :buyers
	has_many :buys, through: :buyers, source: :product, foreign_key: "product_id"
end
