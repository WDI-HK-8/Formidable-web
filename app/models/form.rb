class Form
  include Mongoid::Document
  field :name, type: String
  field :content, type: Array

end
