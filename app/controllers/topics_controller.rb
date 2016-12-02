class TopicsController < ApplicationController
    before_action :logged_in_user, only: [:show]

	def show
		@topic = Topic.find(params[:id])
		@zones = Zone.where(topics_id: params[:id]).order('zones.difficulty ASC')

        @questionsArray = []
        @zones.each_with_index do |zone, count|
            @questionsArray.push(Question.where(zones_id: zone.id).order(id: :asc).to_a)
        end

        @overAllCount = 1

        # check if progress exist, if not create a new progress for current user
        @progress = Progress.where("topics_id = ? AND users_id = ?", @topic.id, current_user.id).first

        if @progress.blank?
            @progress = Progress.create(
                users_id: current_user.id,
                topics_id: @topic.id,
                questions_id: 0,
                lives: 5,
                level: 0,
            )
        end

        
	end
end


