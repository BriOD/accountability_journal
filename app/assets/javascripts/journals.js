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

      $(`#entry-${entry.id}-preview`).click(function(e){
        e.preventDefault()
        let url = this.href
        $.ajax({
          method: "GET",
          url: url + ".json"
        }).done(function(data){
          $('.modal').html(`
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title center" id="exampleModalLongTitle">${data.date}</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <iframe src="${url}" width = "550px" height = "450px"></iframe>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
              </div>
            </div>
            `)
            $('.modal').modal('show')
          })
        })
      })
    })
  })
