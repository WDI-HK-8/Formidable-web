class NameValidator < ActiveModel::Validator
  def validate(record)
    if record.name.length < 2 || record.name.length > 30
      record.errors[:base] << "Length must be between 2 and 30 characters"
    elsif record.name.gsub(/\s/,'*') == record.name && record.name.index(' ') == -1
      record.errors[:base] << "Cannot be all spaces"
    end
  end
end

class Form < ActiveRecord::Base
  has_many :contents, dependent: :destroy
  has_many :submissions, dependent: :destroy
  belongs_to :user
  validates_with NameValidator
  # , fields: [:name]
end
