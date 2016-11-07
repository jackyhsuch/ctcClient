# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
    $("#question-submit-btn").click (e) ->
        ans = $('input[name=questionOptions]:checked').val()
        questionId = $(this).data("questionid")
        console.log questionId
        $.ajax '/submit_answer',
        type: "POST",
        dataType: "JSON",
        data: {
            userAns: ans,
            questionId: questionId,
        },
        asnyc: false,
        success: (data) ->
            console.log data
            if data["isCorrect"]
                console.log "correct"
            else
                console.log "wrong"
            