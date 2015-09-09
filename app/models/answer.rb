class Answer < ActiveRecord::Base
  belongs_to :content, :submission
  serialize :values
end
