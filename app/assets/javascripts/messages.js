$(function() {
  function buildHTML(message){
    var image = message.image_url ? `<img src='${message.image_url}'>`:"";
    var html = `<div class='message'>
                  <div class='upper-message'>
                    <div class='upper-message__user-name'>
                      ${message.user_name}
                    </div>
                    <div class='upper-message__date'>
                      ${message.created_at}
                    </div>
                  </div>
                  <div class='lower-message'>
                    <p class='lower-message__content'>
                      ${message.body}<br>
                      ${image}
                    </p>
                  </div>
                </div>`
    return html;
  }

  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: 'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.messages').append(html)
      $('.form__message').val('');
      $('.hidden').val('');
      $('.messages').animate({scrollTop: $('.messages')[0].scrollHeight }, 'fast');
      $('[name=commit]').prop('disabled',false);
    })
    .fail(function() {
      alert('書込みに失敗しました。再度書込みしてください。');
      $('[name=commit]').prop('disabled',false);
    })
  });
});
