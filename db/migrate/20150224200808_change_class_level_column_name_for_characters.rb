class ChangeClassLevelColumnNameForCharacters < ActiveRecord::Migration
  def change
    change_table :characters do |t|
      t.rename :class_and_level, :class_levels
    end
  end
end
