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
    $.ajax({
      url: action,
      data: params,
      dataType: "json",
      method: "POST"
    })
    .success(function(json){
      var account = new Account(json);
      var accountDiv = account.renderDiv()
      $("#activities-div").append(accountDiv)
    })
    .error(function(response){
      console.log("Broke?", response)
    })
  })
})
