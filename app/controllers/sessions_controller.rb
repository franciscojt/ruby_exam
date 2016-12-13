class SessionsController < ApplicationController
	
	def new
		
	end
	def create
		user = User.find_by(email: session_params[:email])
		if user && user.authenticate(session_params[:password])
			session[:id] = user.id
			redirect_to user_show_path(user.id)
		else
			flash[:errors] = ["invalid email or password"]
			redirect_to sessions_new_path
		end
	end
	def destroy
		session.clear
		redirect_to sessions_new_path
	end
	private
		def session_params
			params.require(:user).permit(:email, :password)
		end
end
