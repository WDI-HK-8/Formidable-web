class Content < ActiveRecord::Base
  belongs_to :form
  has_many :answers, dependent: :destroy
  serialize :options, Array
end
