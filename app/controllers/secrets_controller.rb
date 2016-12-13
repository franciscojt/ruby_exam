class SecretsController < ApplicationController
	before_action :require_login, only: [:index, :create, :destroy]
	
	def index
		@secrets = Secret.all.includes(:users_liked)
		@users = User.all
		
	end
	def create
		secret = Secret.new(secret_params)
		if secret.save
			redirect_to user_show_path(session[:id])
		else
			flash[:errors] = secret.errors.full_messages
		end
	end
	def destroy
		secret = Secret.find(params[:id])
		if secret.destroy
			redirect_to user_show_path(session[:id])
			else
			flash[:errors] = secret.errors.full_messages
		end
	end
	private
		def secret_params
			params.require(:secret).permit(:content, :user_id)
		end

end
