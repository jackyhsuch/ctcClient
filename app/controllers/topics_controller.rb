class TopicsController < ApplicationController

	def show
		@topic = Topic.find(params[:id])
		@zones = Zone.where(topic_id: params[:id]).order('zones.difficulty ASC')

        @questionsArray = []
        @zones.each_with_index do |zone, count|
            @questionsArray.push(Zones_Question.where(zone_id: zone.id).to_a)
        end

        @overAllCount = 1
	end
end


