class TopicsController < ApplicationController

	def show
		@topic = Topic.find(params[:id])
		@zones = Zone.where(topic_id: params[:id]).order('zones.difficulty ASC')
	end

end
