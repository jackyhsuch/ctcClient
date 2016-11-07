class UsersController < ApplicationController
	before_action :logged_in_user, only: [:edit, :update, :show]


	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.name = user_params['first_name'].capitalize + " " + user_params['last_name'].capitalize

		if @user.save!
			log_in @user
			flash[:success] = "Sign up successfully!"
			redirect_to @user
		else
		  render 'new'
		end

	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name,
										:email, :nationality, 
										:date_of_birth, :contact_number, 
										:password, :password_confirmation)
	end

	# Before filters



end
