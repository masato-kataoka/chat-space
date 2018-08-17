$(function() {
  var search_list = $('#user-search-result');

  function appendUser(user) {
    var html = `
      <div class='chat-group-user clearfix'>
        <p class='chat-group-user__name'>${user.name}</p>
        <a class='user-search-add chat-group-user__btn chat-group-user__btn--add' data-user-id='${user.id}' data-user-name='${user.name}'>追加</a>
      </div>
    `;
    search_list.append(html)
  }

  function appendNoUser(user) {
    var html = `
      <div class='chat-group-user clearfix'>
        ${user}
      </div>
    `;
    search_list.append(html);
  }

  function appendMember(user_id, user_name) {
    var html = `
      <div class='chat-group-user clearfix js-chat-member' id='chat-group-user-${user_id}'>
        <input name='group[user_ids][]' type='hidden' value='${user_id}'>
        <p class="chat-group-user__name">${user_name}</p>
        <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>削除</a>
      </div>
    `;
    $('#chat-group-users').append(html)
  }

  $('#user_search_field').on('keyup', function() {
    var inputs = $('#user_search_field').val();
    $.ajax({
      type: 'GET',
      url: '/users',
      data: { keyword: inputs },
      dataType: 'json'
    })
    .done(function(users) {
      $('#user-search-result').empty();
      if (users.length !== 0 && inputs.length !== 0) {
        users.forEach(function(user){
          appendUser(user);
        });
      }
      else {
        appendNoUser('一致するユーザーはいません');
      }
    })
    .fail(function() {
      alert('ユーザー検索に失敗しました');
    })
  });

  $('#user-search-result').on('click', '.user-search-add', function() {
    var user_id = $(this).data('user-id');
    var user_name = $(this).data('user-name');
    appendMember(user_id, user_name);
    $(this).parent().remove();
  });

  $('#chat-group-users').on('click', '.js-remove-btn', function() {
    $(this).parent().remove();
  });
});
