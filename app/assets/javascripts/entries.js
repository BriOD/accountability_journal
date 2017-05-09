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
  $("[data-disable-with]").removeAttr("data-disable-with");
  // Rails 5 issue where it automatically locks the submit button. Had to override that.
  $("form#new_activity_account").on("submit", function(e){
    e.preventDefault()
    var $form = $(this);
    var action = $form.attr("action");
    var params = $form.serialize();
    // debugger;

    // fetch(url, {
    //
    // })
    //   .then(res => res.json())
    //   .then(data => console.log(data))
    //   .catch(err => console.log(err))
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


$(function(){
  $("#js-next").on("click", function(e){
    e.preventDefault()
    $.ajax({
      method: "GET",
      url: '/entries/15.json'// I want to url for the next entry
    }).done(function(data){
      var date = data.date;
      var accounts = data.activity_accounts;

      $(".panel-body").html("") //clear the activities div



      accounts.forEach(function(acc){
        //here is where i want to create an account div for each acc, and then append it to the activites div
        var account = new Account(acc);
        var accountDiv = account.renderDiv()
        $("#activities-div").append(accountDiv)
      })
      $("#date").html(date)
      // $(".panel-body").html("") //clear the activities div
      // accounts.forEach(function(acc){
      //   var account = new Account(acc);
      //   var accountDiv = account.renderDiv()
      //   debugger

      //
      //   $("#activities-div").append(account)
      // })
      //itterate throught the activity accounts array, and append it to activities div



      // The data is an instance of an entry. I want to redraw the DOM to reflect the info of this entry
      //I will need to select the date and replace it.
      //I will also need to itterate through the activity_accounts of the new entry, and create an activity div
      //for every activity-account this entry has.

    });

  })
})


// Prombelms i want to address:
// 1. content-type should be json, not html
// 2. why does the page freeze, and form fields are still occupied?
