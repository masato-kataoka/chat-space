$(function() {

  function buildHTML(data) {
//    return html;
  }

  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var formData = new FormData($(this).get(0));
//    var group_id = $('.group_id').attr('value');
//    var url = '/groups/' + group_id + '/messages.json'
    $.ajax({
      type: 'POST',
      url: '../messages#create.json',
      data: formData,
      processData: false,
      contentType: false
    })
    .done(function(data) {
//      console.log(data);
      var html = buildHTML(data);
//      $('#chat-message__body').append(html);
      $('#new_message').append(formData);
      $('#new_message').val('');
    })
    .fail(function() {
      alert('エラー');
    });
  });
});
