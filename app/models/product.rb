class Product < ActiveRecord::Base
  belongs_to :user
	has_many :buyers
	has_many :boughts, through: :buyers, source: :user, foreign_key: "user_id"
	validates_presence_of :name, :price
	after_initialize :init
	
	def init
		self.bought = false if self.bought.nil?
	end
end
