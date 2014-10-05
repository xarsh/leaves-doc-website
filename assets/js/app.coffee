$ ->
  $(document).scroll ->
    $('nav li a').each ->
      if $($(@).attr("href")).position().top <= $(document).scrollTop() + 30
        $('nav li a').removeClass('active')
        $(@).addClass('active')
      else
        $(@).removeClass('active')

