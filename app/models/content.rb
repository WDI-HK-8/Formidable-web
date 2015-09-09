class Content < ActiveRecord::Base
  belongs_to :form
  has_many :submissions
  serialize :options
end
