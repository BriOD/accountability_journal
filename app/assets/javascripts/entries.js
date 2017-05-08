function Account(attributes) {
  this.daily_activity = attributes.daily_activity;
  this.completion = attributes.completion;
  this.duration = attributes.duration;
  this.notes = attributes.notes;
  this.id = attributes.id;

}

$(function(){
Account.templateSource = $("#account-template").html()
Account.template = Handlebars.compile(Account.templateSource);
})

Account.prototype.renderDiv = function(){
  return Account.template(this)

}



$(function(){
  $("form#new_activity_account").on("submit", function(e){
    e.preventDefault()
    var $form = $(this);
    var action = $form.attr("action");
    var params = $form.serialize();
    // debugger;
    $.ajax({
      url: action,
      data: params,
      dataType: "JSON",
      method: "POST"
    })
    .success(function(json){
      var account = new Account(json);
      var accountDiv = account.renderDiv()
      var $completionField = $("#activity_account_completion")
      var $durationField = $("#activity_account_duration")
      var $notesField = $("#activity_account_notes")
      // debugger

      $("#activities-div").append(accountDiv)
      $completionField.val("")
      $durationField.val("")
      $notesField.val("")

    })
    .error(function(response){
      console.log("Broke?", response)
    })
  })
})

// Prombelms i want to address:
// 1. content-type should be json, not html
// 2. why does the page freeze, and form fields are still occupied?
