class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :answers
      t.belongs_to :submission, foreign_key: true, index: true
      t.belongs_to :content, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end
