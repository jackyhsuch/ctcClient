# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
    $("#question-submit-btn").click (e) ->
        ans = $('input[name=questionOptions]:checked').val()
        questionId = $(this).data("questionid")

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
                $("#flash-message").html("Correct!")
                $("#flash-message").show()
                console.log "correct"
            else
                console.log "wrong"
                $("#flash-message").html("Wrong!")
                $("#flash-message").show()

            $('#question-submit-btn').prop('disabled', true)
            