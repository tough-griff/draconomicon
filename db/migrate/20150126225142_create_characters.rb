class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.belongs_to :user,      index: true
      t.string     :name,      null: false, default: ""
      t.string     :slug,      null: false
      t.text       :class_and_level
      t.string     :background
      t.string     :player_name
      t.string     :race
      t.string     :alignment, null: false, default: "True Neutral"
      t.integer    :experience, default: 0
      t.integer    :age
      t.string     :height
      t.string     :weight
      t.string     :eyes
      t.string     :skin
      t.string     :hair

      t.timestamps null: false
    end
  end
end
