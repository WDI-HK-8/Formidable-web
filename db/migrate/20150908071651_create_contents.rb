class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.integer :index
      t.string :category
      t.string :label
      t.string :options
      t.belongs_to :form, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end
