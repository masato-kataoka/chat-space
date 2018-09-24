$(function() {
  function buildHTML(message){
    var image = message.image_url ? `<img src='${message.image_url}'>`:"";
    var html = `<div class='message' data-message-id="${message.id}">
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
                    </p>
                    ${image}
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
      $('.form__submit').prop('disabled', false);
      $('html,body').animate({ scrollTop: $(document).height() }, 'fast');
    })
    .fail(function() {
      alert('書込みに失敗しました。再度書込みしてください。');
    });
  });

  $(function () {
    setInterval(update, 5000);
  });

  function update() {
    if (window.location.href.match(/\/groups\/\d+\/messages/)) {
      $.ajax({
        type: 'GET',
        url: location.href,
        dataType: 'json'
      })
      .always(function (data) {
        var last_id = $('.message:last').data('message-id') || 0;
        var insertHTML = '';
        data.messages.forEach(function(message){
          if (message.id > last_id) {
            insertHTML += buildHTML(message);
          }
        });
        $('.messages').append(insertHTML);
        $('html,body').animate({ scrollTop: $(document).height() }, 'fast');
      });
    } else {
      clearInterval(setInterval);
    }
  };
});
