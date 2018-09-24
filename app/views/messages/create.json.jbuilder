json.body       @message.body
json.image_url  @message.image.url
json.datetime   @message.created_at.to_s(:datetime)
json.user_name  @message.user.name
