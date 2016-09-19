$ ->
  $('#event_logo').on 'change', (event) ->
    files = event.target.files
    image = files[0]
    reader = new FileReader

    reader.onload = (file) ->
      img = new Image
      img.src = file.target.result
      $('.preview').html img
    reader.readAsDataURL image
