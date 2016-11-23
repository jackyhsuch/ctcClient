class TowersController < ApplicationController
    before_action :logged_in_user, only: [:index, :show]

	def index
		@towers = Tower.all
	end

	def show
		@tower = Tower.find(params[:id])
		@topics = Topic.where(tower_id: params[:id])
	end

end
