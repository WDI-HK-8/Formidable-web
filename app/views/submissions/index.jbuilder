json.array! @submissions do |submission|
  json.id submission.id
  json.user_id submission.user_id
  json.answers submission.answers
  json.created_at submission.created_at
  json.updated_at submission.updated_at
end 
