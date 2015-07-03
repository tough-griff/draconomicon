class CreateWeapons < ActiveRecord::Migration
  def change
    create_table :weapons do |t|
      t.belongs_to :character, index: true
      t.string     :name,      null: false, default: ""
      t.string     :category,  null: false, default: "simple"
      t.string     :type,      null: false, default: "melee"
      t.string     :cost
      t.integer    :attack_bonus
      t.string     :damage
      t.string     :damage_type
      t.string     :weight
      t.text       :properties
      t.text       :description

      t.timestamps null: false
    end
  end
end
