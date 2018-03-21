$(function() {
  function buildHTML(message){
    
  }

  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var formData = new FormData($(this).get(0));
    $.ajax({
      type: 'POST',
      url: '../messages#create.json',
      data: formData,
      processData: false,
      contentType: false
    })
    .done(function(data) {
//      $('.chat-body').append(data);
//        $('.')
//      //  setTimeout(function() {
//        $('.chat-body').animate({scrollTop: $('.chat-message')[0].scrollHeight}, 'fast');
//      //  }, 1500);
      $('<div>').addClass('message')
      .append($('<div>').addClass('upper-message'))
      .append($('<div>').addClass('upper-message__user-name'))
      .append('kataoka')
      .append($('<div>').addClass('upper-message__date'))
      .append('2018-03-10 08:53:49 UTC')
      .append($('<div>').addClass('lower-message'))
      .append('<p>').addClass('lower-message__content')
      .append('テスト6')
    })
    .fail(function() {
      alert('書込みに失敗しました。再度書込みしてください。');
    });
  });
});
