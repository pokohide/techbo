$(document).ready(function() {
  $('#entry_image').on('change', function() {
    if(!this.files.length) return
    var file = $(this).prop('files')[0]
    var fr = new FileReader()
    fr.onload = function() {
      $('.preview-image').attr('src', fr.result).removeClass('disabled')
    }
    fr.readAsDataURL(file)
  })
})
