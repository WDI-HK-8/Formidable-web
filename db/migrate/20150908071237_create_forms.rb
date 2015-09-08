class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :name
      t.belongs_to :user, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end
