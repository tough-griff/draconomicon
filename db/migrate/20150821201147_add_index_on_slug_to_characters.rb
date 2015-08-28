class AddIndexOnSlugToCharacters < ActiveRecord::Migration
  def change
    add_index :characters, :slug
  end
end
