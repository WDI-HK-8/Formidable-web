class Form < ActiveRecord::Base
  has_many :contents, :submissions
  belongs_to :user
end
