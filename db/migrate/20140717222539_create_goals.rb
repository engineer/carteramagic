class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.float :amount
      t.string :image
      t.datetime :date
      
      t.timestamps
    end
    add_foreign_key :goals, :users
  end
end
