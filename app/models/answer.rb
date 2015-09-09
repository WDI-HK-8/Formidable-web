class Answer < ActiveRecord::Base
  belongs_to :content
  belongs_to :submission
  serialize :values
end
