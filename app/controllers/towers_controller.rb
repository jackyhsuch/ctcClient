class TowersController < ApplicationController

	def index
		@towers = Tower.all
	end

	def show
		@tower = Tower.find(params[:id])
		@topics = Topic.where(tower_id: params[:id])
	end

end
