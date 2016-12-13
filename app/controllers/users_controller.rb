class UsersController < ApplicationController
	before_action :require_login, except:[:new, :create]
	before_action :require_correct_user, only: [:show, :edit, :update, :destroy]
	
	def index
	end
	def new
	end
	def create
		user = User.new(user_params)
		if user.save
			session[:id]= user.id
			redirect_to user_show_path(user.id)
			else 
			puts user.errors
			flash[:errors] = user.errors.full_messages
			redirect_to users_new_path
		end
	end
	def show
		load_user
		@secrets = @user.secrets
	end
	def edit
		load_user
	end
	def update
		load_user
		
		if @user.update(user_params)
			flash[:success] = "User updated succesfully"
			redirect_to user_show_path(@user.id)
			else
			flash[:errors]=@user.errors.full_messages
			redirect_to :back
		end
	end
	def destroy
		load_user
		if @user.destroy
			session.clear
			redirect_to sessions_new_path
			else
			flash[:errors]=@user.errors.full_messages
		end
	end
	private
		def user_params
			params.require(:user).permit(:name, :email, :password,:password_confirmation)
		end	
		def load_user
			@user = User.find(params[:id])
		end
end
