$(document).ready(function() {
  $('#watch-image').on('change', function() {
    if(!this.files.length) return
    var file = $(this).prop('files')[0]
    var fr = new FileReader()
    fr.onload = function() {
      $('.preview-image').attr('src', fr.result).removeClass('disabled')
    }
    fr.readAsDataURL(file)
  })

  $('#entry_tag_list').tagit()
  //$('#entry_is_draft').checkbox()

  $('.comment-reply').on('click', function(e) {
    e.preventDefault()
    var reply = $(this).attr('data-reply')
    var comment = $('#comment_body').val()
    $('#comment_body').val('@' + reply + "\n" + comment)
  })

  $('.md-view-tab .item').on('click', function(e) {
    e.preventDefault()
    var $div = $(this)
    var type = $(this).attr('data-type')

    $('.md-view-tab .item.active').removeClass('active')
    $(this).addClass('active')

    if(type === 'text') {
      $('.md-view-field .text-view').show()
      $('.md-view-field .md-view').hide()
      $('.md-view-field .diff-view').hide()
    } else if(type === 'view') {
      $('.md-view-field .md-view').show()
      $('.md-view-field .text-view').hide()
      $('.md-view-field .diff-view').hide()

      var text = $('.text-view textarea').val()
      $.ajax({
        url: '/api/md_view',
        type: 'POST',
        dataType: 'json',
        data: 'text=' + text
      }).done(function(data) {
        console.log(data)
      }).error(function(error) {
        console.log(error.responseText)
        var view = error.responseText
        $('.md-view-field .md-view').html(view)
      })
    } else if(type === 'diff') {
      $('.md-view-field .diff-view').show()
      $('.md-view-field .md-view').hide()
      $('.md-view-field .text-view').hide()
    }
  })
})
