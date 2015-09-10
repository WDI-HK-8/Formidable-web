class Form < ActiveRecord::Base
  has_many :contents, dependent: :destroy
  has_many :submissions, dependent: :destroy
  belongs_to :user
  validates :name, length: { in: 2..30 }
end
