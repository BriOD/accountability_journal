$(function(){
  let url = $("#js-previous-posts")["0"].attributes[1].nodeValue
  $.ajax({
    method: "GET",
    url: url
  }).done(function(data){
    $("#prev-entries").html('')
    data.forEach(function(entry){
      let formattedEntry = `<a href="/entries/${entry.id}" id="entry-${entry.id}-preview"><h4>${entry.date}</h4></a>`

      $("#prev-entries").append(formattedEntry)

        $(`#entry-${entry.id}-preview`).hover(function(e){
          console.log(this)
          let url = this.href
          $(this).append(`<div class='preview-div'></div>`)
          $.ajax({
            method: "GET",
            url: url
           }).done(function(data){
              let src = this.url
              $(".preview-div").append(`<iframe src="${url}" width = "300px" height = "300px"></iframe>`)
           })
         }, function(e){
           $(".preview-div").remove();
         })
    })
  })
})

  // $(document).on('mouseenter', ".entry-preview", function(e) {
  //   let url = this.href
  //  $(this).append("<div class='preview-div'></div>")
  //   $.ajax({
  //     method: "GET",
  //     url: url
  //   }).done(function(data){
  //     let src = this.url
  //     $(".preview-div").append(`<iframe src="${url}" width = "300px" height = "300px"></iframe>`)
  //   })
  // })
  //
  // $(document).on('mouseleave', ".entry-preview", function() {
  //   $(".preview-div").remove();
  // })
