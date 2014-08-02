class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.float :amount, null: false
      t.date :start_at, null: false
      t.date :end_at, null: false
      t.string :concept
      t.float :daily_goal
      t.float :total_saved
      t.belongs_to :user
      t.timestamps
    end
  end
end
