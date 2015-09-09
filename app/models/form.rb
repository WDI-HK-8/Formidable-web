class Form < ActiveRecord::Base
  has_many :contents
  belongs_to :user
end
