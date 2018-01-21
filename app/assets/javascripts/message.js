$(function() {
  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var textField = $('#message_body');
    message = textField.val();
    console.log(message);
  });
});
