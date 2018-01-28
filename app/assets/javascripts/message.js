$(function() {

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
      $('.chat-body').append(data);
      //  setTimeout(function() {
          $('.chat-body').animate({scrollTop: $('.chat-message__header p:last-child').offset().top}, 'fast');
      //  }, 1500);
    })
    .fail(function() {
      alert('書込みに失敗しました。再度書込みしてください。');
    });
  });
});
