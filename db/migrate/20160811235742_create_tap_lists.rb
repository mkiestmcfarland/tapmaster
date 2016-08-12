class CreateTapLists < ActiveRecord::Migration
  def change
    create_table :tap_lists do |t|
      t.integer :user_id, null:false
      t.timestamps null: false
    end
  end
end
