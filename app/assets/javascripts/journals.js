$(function(){
  // $("#js-previous-posts").on("click", function(e){
  //   e.preventDefault()
  //   let url = this.href
    let url = $("#js-previous-posts")["0"].attributes[1].nodeValue
    // console.log(url)
    $.ajax({
      method: "GET",
      url: url
    }).done(function(data){
      $("#prev-entries").html('')
      data.forEach(function(entry){
        let formattedEntry = `<a href="/entries/${entry.id}" class="entry-preview"><h4>${entry.date}</h4></a>`
        $("#prev-entries").append(formattedEntry)
      })
    })
  // })
})

// <div class="box"><iframe src="/entries/${entry.id}" width = "500px" height = "500px"></iframe></div>

$(document).on('mouseenter', ".entry-preview", function(e) {
  let url = this.href
 $(this).append("<div class='preview-div'></div>")
  $.ajax({
    method: "GET",
    url: url
  }).done(function(data){
    let src = this.url
    $(".preview-div").append(`<iframe src="${url}" width = "300px" height = "300px"></iframe>`)
  })
})

$(document).on('mouseleave', ".entry-preview", function() {
  $(".preview-div").remove();
})




// <a href="http://www.jquery.com/">JQuery</a>
// <div class="box"><iframe src="http://www.jquery.com/" width = "500px" height = "500px"></iframe></div>

// $("#preview-div").append(`<iframe src="${url}" width = "500px" height = "500px"></iframe>`)
  // show the preview

// have previous entries load on page load instead of click events
// have hover feature that shows preview of what the link will load
