class AddNotesToCheckIn < ActiveRecord::Migration[6.0]
  def change
    add_column :check_ins, :notes, :text
  end
end
