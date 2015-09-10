class Answer < ActiveRecord::Base
  belongs_to :content
  belongs_to :submission
  # include ActiveModel::Serialization
  # serialize :values, Array
end
