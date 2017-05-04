
$(function(){
  $("#new_activity_account").on("submit", function(e){
    console.log(this)
    // 1. need a URL to submit the POST request to
    url = this.action

    data = {
      'auth_token' : $("input[name='authenticity_token']").value(),
      'activity_account' : {
        
      }
    }
    // 2. need form data

    e.preventDefault();
  })
})
