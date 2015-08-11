class AddNecessaryForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :characters, :users,      name: :characters_user_id_fk,   on_delete: :cascade
    add_foreign_key :armors,     :characters, name: :armors_character_id_fk,  on_delete: :cascade
    add_foreign_key :items,      :characters, name: :items_character_id_fk,   on_delete: :cascade
    add_foreign_key :weapons,    :characters, name: :weapons_character_id_fk, on_delete: :cascade
  end
end
