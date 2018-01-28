json.post do |json|
  json.body @message.body
  json.image @message.image
  json.group @message.group
  json.user @message.user
end
