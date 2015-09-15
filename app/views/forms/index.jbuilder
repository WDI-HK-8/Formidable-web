json.array! @forms do |form|
  json.id form.id
  json.name form.name
  json.signature_required form.signature_required
  json.user_id form.user_id
  json.created_at form.created_at
  json.updated_at form.updated_at
  json.contents form.contents
end 