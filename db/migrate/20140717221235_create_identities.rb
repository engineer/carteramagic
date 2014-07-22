class CreateIdentities < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, null: false, default: ''
    add_column :users, :last_name, :string, null: false, default: ''
    add_column :users, :age, :string, null: true, default: ''
    add_column :users, :birthday, :string, null: true, default: ''
    add_column :users, :link, :string, null: true, default: ''
    add_column :users, :gender, :string, null: true, default: ''
    add_column :users, :image, :string, null: true, default: ''

    create_table :identities do |t|
      t.integer :user_id
      t.string :provider
      t.string :provider
      t.string :uid
      t.string :url
      t.string :name
      t.string :email
      t.string :token
      t.string :secret
      t.string :handle

      t.timestamps
    end
    add_foreign_key :identities, :users
  end
end
