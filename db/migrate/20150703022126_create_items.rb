class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :character, index: true
      t.string     :name,      null: false, default: ""
      t.string     :cost
      t.string     :weight
      t.integer    :quantity
      t.text       :description

      t.timestamps null: false
    end
  end
end
