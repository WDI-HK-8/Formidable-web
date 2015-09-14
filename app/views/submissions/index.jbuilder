json.array! @submissions do |submission|
  json.id submission.id
  json.signature submission.signature
  json.form_id submission.form_id
  json.form_id submission.form_id
  json.answers submission.answers
  json.created_at submission.created_at
  json.updated_at submission.updated_at
end 
