class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :answers
      t.string :submission_key
      t.belongs_to :content, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end
