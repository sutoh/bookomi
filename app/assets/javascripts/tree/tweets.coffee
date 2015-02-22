# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $(".edit_manga").on("ajax:success", (xhr, data, status) ->
    $('#tag-block>.tag-list li').remove()
    $('ul#modal-tag-lists li').remove()
    data.forEach( (obj)->
      modal = "<li><a href='" + obj.show_url + "'>" + obj.name + "</a></li>"
      $('#tag-block>.tag-list').append(modal)
      tags = "<li><a data-remote='true' rel='nofollow' data-method='delete' href='"+obj.delete_url+"'><i class='fa fa-trash-o'></i></a><span>" + obj.name + "</span></li>"
      $('ul#modal-tag-lists').append(tags)
      console.log "Success"
    )
  )
  $(".edit_manga").on("ajax:error", (xhr, data, status) ->
    console.log "error"
    console.log data
  )
