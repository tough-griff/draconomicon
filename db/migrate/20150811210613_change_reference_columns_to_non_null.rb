class ChangeReferenceColumnsToNonNull < ActiveRecord::Migration
  def change
    change_column_null :characters, :user_id,      false
    change_column_null :armors,     :character_id, false
    change_column_null :items,      :character_id, false
    change_column_null :armors,     :character_id, false
  end
end
