class CreateBeverages < ActiveRecord::Migration
  def change
    create_table :beverages do |t|
      t.string     :name, null:false
      t.decimal    :abv
      t.decimal    :ibu
      t.integer    :beverage_style_id
      t.timestamps null: false
    end
    add_foreign_key :beverages, :beverage_styles
  end
end
