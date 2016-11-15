class QuestionsController < ApplicationController
    before_action :logged_in_user, only: [:edit, :update, :show]
    
    def show
        zoneId = params[:zone_id]
        questionId = params[:question_id]
        # id is zone_id
        @question = Question.find(questionId)
        @zone = Zone.find(zoneId)

        @next_question = Zones_Question.next(zoneId, questionId)

        @progress = Progress.where("topics_id = ? AND users_id = ?", @zone.topic_id, current_user.id).first


        @level = params[:level]
        @next_level = params[:level].to_i + 1
    end

    def submit
        # @userAns = params[:optionsRadios]
        @userAns = params[:userAns]
        @correctAns = Question.find(params[:questionId]).answer
        @zone = Zone.find(params[:zoneId])

        @progress = Progress.where("topics_id = ? AND users_id = ?", @zone.topic_id, current_user.id).first
        @progress.question_id = params[:questionId]
        @progress.level = params[:level]

        if @userAns == @correctAns
            @respond = true
        else
            @progress.lives -= 1
            @respond = false
        end

        @progress.save

        respond_to do |format|
            format.html
            format.js {} 
            format.json { 
                render json: {
                    isCorrect: @respond
                }
            }
        end
    end
end
