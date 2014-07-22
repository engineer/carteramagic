class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.float :amount
      t.date :start_at
      t.date :end_at
      t.string :concept
      t.belongs_to :user
      t.timestamps
    end
  end
end
