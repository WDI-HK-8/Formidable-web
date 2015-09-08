json.id @form.id
json.name @form.name
json.user_id @form.user_id
json.created_at @form.created_at
json.updated_at @form.updated_at
json.array! @form.contents do |content|
  json.id content.id
  json.type content.type
  json.index content.index
  json.label content.label
  json.options content.options
  json.created_at content.created_at
  json.updated_at content.updated_at
end