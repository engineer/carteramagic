class CreateNonRecurringExpenses < ActiveRecord::Migration
  def change
    create_table :non_recurring_expenses do |t|
      t.integer :user_id
      t.string :name
      t.float :amount
      t.boolean :ingress, default: false, null: false
      t.boolean :egress, default: false, null: false

      t.timestamps
    end
    add_foreign_key :non_recurring_expenses, :users
  end
end
