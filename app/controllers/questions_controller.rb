class QuestionsController < ApplicationController
    before_action :logged_in_user, only: [:edit, :update, :show]
    
    def show
        zoneId = params[:zone_id]
        questionId = params[:question_id]
        # id is zone_id
        @question = Question.find(questionId)
        # @question = Zones_Question.where(zone_id: zoneId, question_id: questionId)
        @zone = Zone.find(zoneId)
    end

    def submit
        # @userAns = params[:optionsRadios]
        @userAns = params[:userAns]
        @correctAns = Question.find(params[:questionId]).answer

        if @userAns == @correctAns
            @respond = true
        else
            @respond = false
        end

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
