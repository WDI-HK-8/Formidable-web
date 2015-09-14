json.array! @forms do |form|
  json.id form.id
  json.name form.name
  json.user_id form.user_id
  json.created_at form.created_at
  json.updated_at form.updated_at
  json.contents form.contents
  json.array! form.submissions do |submission|
    json.id submission.id
    json.signature submission.signature
    json.form_id submission.form_id
    json.answers submission.answers
    json.created_at submission.created_at
    json.updated_at submission.updated_at
  end
end 