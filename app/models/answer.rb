class Answer < ActiveRecord::Base
  belongs_to :content
  belongs_to :submission

  store_accessor :values
end
