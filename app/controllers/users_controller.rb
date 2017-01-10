class UsersController < ApplicationController
	before_action :logged_in_user, only: [:edit, :update, :show]


	def show
		@user = User.find(params[:id])

		# pull progress and show current user's progresss on each tower
		@progresses = Progress.where(users_id: current_user.id).where("lives > ?", 0)

		@progresses.each do |progress|
			topic = Topic.find(progress.topics_id)
			progress.topic_name = topic.name
			progress.tower_id = topic.towers_id.to_i
			progress.tower_name = Tower.find(topic.towers_id).name
		end

		@progresses = @progresses.sort_by(&:tower_id)

		# pull progress and show current user's progresss on each tower
		@completedProgresses = Progress.where(users_id: current_user.id).where("lives = ?", 0)

		@completedProgresses.each do |completedProgress|
			topic = Topic.find(completedProgress.topics_id)
			completedProgress.topic_name = topic.name
			completedProgress.tower_id = topic.towers_id
			completedProgress.tower_name = Tower.find(topic.towers_id).name
		end

		@completedProgresses = @completedProgresses.sort_by(&:tower_id)

		@previousTowerId = 0


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
