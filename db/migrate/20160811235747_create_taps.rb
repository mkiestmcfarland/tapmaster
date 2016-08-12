class CreateTaps < ActiveRecord::Migration
  def change
    create_table :taps do |t|
      t.integer :beverage_id
      t.integer :tap_list_id
      t.integer :position
      t.timestamps null: false
    end
    add_foreign_key :taps, :beverages
    add_foreign_key :taps, :tap_lists
  end
end
