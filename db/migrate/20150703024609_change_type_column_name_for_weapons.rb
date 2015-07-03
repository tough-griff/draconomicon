class ChangeTypeColumnNameForWeapons < ActiveRecord::Migration
  def change
    change_table :weapons do |t|
      t.rename :type, :classification
    end
  end
end
