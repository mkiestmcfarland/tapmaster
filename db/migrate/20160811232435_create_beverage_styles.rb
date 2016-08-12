class CreateBeverageStyles < ActiveRecord::Migration
  def change
    create_table :beverage_styles do |t|
      t.string     :name
      t.integer    :beverage_type_id
      t.timestamps null: false
    end
    add_foreign_key :beverage_styles, :beverage_types
  end
end
