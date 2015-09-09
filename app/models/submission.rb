class Submission < ActiveRecord::Base
  belongs_to :content
  serialize :answers
end
