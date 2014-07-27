class CreateVariablePayments < ActiveRecord::Migration
  def change
    create_table :variable_payments do |t|
      t.float :amount
      t.boolean :income
      t.string :concept
      t.belongs_to :user
      t.timestamps
    end
  end
end
