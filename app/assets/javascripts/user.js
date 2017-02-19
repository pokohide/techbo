$(document).ready(function() {

  $('.counter').each(function() {
    var $this = $(this),
        countTo = $this.attr('data-count'),
        duration = 1000 + countTo / 10

    $({ countNum: $this.text() }).animate({ countNum: countTo }, {
      duration: duration,
      easing: 'linear',
      step: function() { $this.text(Math.floor(this.countNum)) },
      complete: function() { $this.text(this.countNum) }
    })
  })
})
