json.array! @submissions do |submission|
  json.id @submission.id
  json.content_id @submission.content_id
  json.answers @submission.answers
  json.submission_key @submission.submission_key
  json.created_at @submission.created_at
  json.updated_at @submission.updated_at
end 