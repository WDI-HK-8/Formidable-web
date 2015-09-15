class AddCompaniesToUsers < ActiveRecord::Migration
  def change
    # change_table :users do |t|
      add_reference :users, :company, foreign_key: true, index: true
    # end
  end
end
