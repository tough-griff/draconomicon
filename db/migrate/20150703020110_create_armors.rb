class CreateArmors < ActiveRecord::Migration
  def change
    create_table :armors do |t|
      t.belongs_to :character, index: true

      t.string  :name,                 default: "",            null: false
      t.string  :category,             default: "Light Armor", null: false
      t.string  :cost
      t.integer :armor_class
      t.integer :minimum_str
      t.boolean :stealth_disadvantage
      t.string  :weight
      t.text    :description

      t.timestamps null: false
    end
  end
end
