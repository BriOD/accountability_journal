$(function(){
  $("#js-previous-posts").on("click", function(e){
    e.preventDefault()
    let url = this.href
    $.ajax({
      method: "GET",
      url: url
    }).done(function(data){
      $("#prev-entries").html('')
      data.forEach(function(entry){
        let formattedEntry = `<a href="/entries/${entry.id}"><h4>${entry.date}</h4></a>`
        $("#prev-entries").append(formattedEntry)
      })
    })
  })
})
