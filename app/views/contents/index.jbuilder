json.array! @contents do |content|
  json.id content.id
  json.form_id content.form_id
  json.type content.type
  json.index content.index
  json.label content.label
  json.options content.options
  json.created_at content.created_at
  json.updated_at content.updated_at
end 
