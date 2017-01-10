class QuestionsController < ApplicationController
    before_action :logged_in_user, only: [:edit, :update, :show]
    
    def show
        zoneId = params[:zone_id]
        questionId = params[:question_id]
        # id is zone_id
        @question = Question.find(questionId)
        @zone = Zone.find(zoneId)

        @next_question = Question.next(zoneId, questionId)

        @progress = Progress.where("topics_id = ? AND users_id = ?", @zone.topics_id, current_user.id).first


        @level = params[:level]
        @next_level = params[:level].to_i + 1

        @finishedLevel = false
        if @level.to_i <= @progress.level
            @finishedLevel = true
        end

        # when reach end of zone
        if @next_question.nil?
            @next_zone = Zone.next(@zone.topics_id, @zone.difficulty)
            @next_zonequestion = Question.next(@next_zone.id, 0)
        end
        

    end

    def submit
        # @userAns = params[:optionsRadios]
        @userAns = params[:userAns]
        @correctAns = Question.find(params[:questionId]).answer
        @zone = Zone.find(params[:zoneId])

        @progress = Progress.where("topics_id = ? AND users_id = ?", @zone.topics_id, current_user.id).first
        @progress.questions_id = params[:questionId]
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
                    isCorrect: @respond,
                    lives: @progress.lives
                }
            }
        end
    end
end
