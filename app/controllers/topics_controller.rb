class TopicsController < ApplicationController

	def show
		@topic = Topic.find(params[:id])
		@zones = Zone.where(topic_id: params[:id]).order('zones.difficulty ASC')

        @questionCount = []
        @zones.each do |zone|
            @questionCount.push(Zones_Question.where(zone_id: zone.id).count)
        end

        @overAllCount = 1
	end
end


