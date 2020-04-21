class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content # ATTRIBUTE IN THROUGH RELATIONSHIP
      t.integer :user_id
      t.integer :spot_id 
      t.timestamps
    end
  end
end
