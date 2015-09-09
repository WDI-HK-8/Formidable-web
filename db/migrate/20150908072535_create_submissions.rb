class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.belongs_to :user, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end
