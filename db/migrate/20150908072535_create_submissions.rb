class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.belongs_to :form, foreign_key: true, index: true
      t.text :submission

      t.timestamps null: false
    end
  end
end
