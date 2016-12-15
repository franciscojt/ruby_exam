class ProductsController < ApplicationController
	def index
		@user = current_user
		@products = Product.all
		
	end
	def create
		product = current_user.products.new(product_params)
		if product.save
			redirect_to :back
			else
			flash[:errors] = product.errors.full_messages
			redirect_to :back
		end
	end
	def destroy
		product= Product.find(params[:id])
			if product.destroy
				redirect_to :back
				else
				flash[:errors] = ["Somenthing went Wrong"]
			end		
	end
	def update
		product = Product.find(params[:id])
		if product.update(bought:true)
			Buyer.create(user:current_user, product:product)
			redirect_to user_path(current_user)
			else
			flash["Transacion was Unsuccesfully"]
			redirect_to :back
		end
	end
	private
		def product_params
			params.require(:product).permit(:name, :price)
		end
end
