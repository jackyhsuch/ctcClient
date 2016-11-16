class TopicsController < ApplicationController


	def show
		@topic = Topic.find(params[:id])
		@zones = Zone.where(topic_id: params[:id]).order('zones.difficulty ASC')

        @questionsArray = []
        @zones.each_with_index do |zone, count|
            @questionsArray.push(Zones_Question.where(zone_id: zone.id).to_a)
        end

        @overAllCount = 1

        # check if progress exist, if not create a new progress for current user
        @progress = Progress.where("topics_id = ? AND users_id = ?", @topic.id, current_user.id).first

        if @progress.blank?
            @progress = Progress.create(
                users_id: current_user.id,
                topics_id:@topic.id,
                lives: 5,
                level: 0,
            )
        end

        
	end
end


