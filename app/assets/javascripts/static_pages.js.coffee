# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  request_waiting = 0
  $('#form')
    .bind 'ajax:success', (e, data, status, xhr)->
      request_waiting = 0
      $('#match-result').html(data.result)
      $('#input-text-preview').html(data.match)

  # TODO:毎回置換が走るのでちょっと遅い…なんとかしたい
  update = ->
    if request_waiting == 0
      $('#form').submit()
      request_waiting = 1
 
  $('#regex_form').bind 'keyup change', update
  $('#replace_form').bind 'keyup change', update
  $('#input_text_form').bind 'keyup chagne', update


  copyToClipboard = (txt) ->
    copyArea = $("<textarea/>")
    copyArea.text(txt)
    $("body").append(copyArea)
    copyArea.select()
    document.execCommand("copy")
    copyArea.remove()

  $('#match-result').click ->
    copyToClipboard $(this).text

  

