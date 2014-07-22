class CreateRecurrentPayments < ActiveRecord::Migration
  def change
    create_table :recurrent_payments do |t|
      t.float :amount
      t.boolean :income
      t.string :concept
      t.date :effective_at
      t.belongs_to :user
      t.timestamps
    end
  end
end
