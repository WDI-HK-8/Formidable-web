class Content < ActiveRecord::Base
  belongs_to :form
  has_many :answers
  serialize :options
end
