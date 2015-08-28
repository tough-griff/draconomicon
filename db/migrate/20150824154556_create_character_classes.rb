class CreateCharacterClasses < ActiveRecord::Migration
  def change
    create_table :character_classes do |t|
      t.string :name,                   default: "", null: false
      t.string :abbreviation, limit: 3, default: "", null: false
      t.string :slug,                                null: false, index: { unique: true }

      t.timestamps null: false
    end
  end
end
