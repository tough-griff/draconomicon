class AddNameAndSlugToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :name, default: "", null: false, limit: 32
      t.string :slug, null: false
    end

    add_index :users, :name, unique: true
    add_index :users, :slug, unique: true
  end
end
