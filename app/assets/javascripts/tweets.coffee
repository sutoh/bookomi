# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $(".edit_manga").on("ajax:success", (xhr, data, status) ->
    data.forEach( (obj)->
      $('#tag-block>.tag-list').html("<li><a href='+ obj.show_url +'>+ obj.name +</a></li>");
      $('ul#modal-tag-lists').html("<li><a data-remote='true' rel='nofollow' data-method='delete' href='+data.delete_url+'><i class='fa fa-trash-o'></i></a></li>")
      console.log "Success"
    )
  )
  $(".edit_manga").on("ajax:error", (xhr, data, status) ->
    console.log "error"
    console.log data
  )
