json.array! @forms do |form|
  json.id form.id
  json.name form.name
  json.user_id form.user_id
  json.content form.content
  json.created_at form.created_at
  json.updated_at form.updated_at
end 