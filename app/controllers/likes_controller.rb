class LikesController < ApplicationController
	def create
		secret = Secret.find(params[:sid])
		like = Like.new(user: current_user, secret:secret)
		if like.save
			redirect_to secrets_path
			else
			flash[:errors]=like.errors.full_message
		end
	end
	def destroy
		secret = Secret.find(params[:sid])
		like = Like.find_by(user: current_user, secret:secret).destroy
		redirect_to secrets_path
	end
end
