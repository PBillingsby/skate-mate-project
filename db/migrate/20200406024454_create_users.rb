class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :password_confirmation
      t.integer :location_id
      t.string :uid
      t.string :provider
      t.timestamps
    end
  end
end
