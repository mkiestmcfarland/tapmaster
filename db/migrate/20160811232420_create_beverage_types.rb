class CreateBeverageTypes < ActiveRecord::Migration
  def change
    create_table :beverage_types do |t|
      t.string     :name, null:false
      t.timestamps null: false
    end
  end
end
