$ ->
  $(document).scroll ->
    $('nav li a').each ->
      if $($(@).attr("href")).position().top <= $(document).scrollTop()
        $('nav li a').removeClass('active')
        $(@).addClass('active')
      else
        $(@).removeClass('active')

