# == Schema Information
#
# Table name: items
#
#  id           :integer          not null, primary key
#  character_id :integer
#  name         :string           default(""), not null
#  cost         :string
#  weight       :string
#  quantity     :integer
#  description  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_items_on_character_id  (character_id)
#

class Item < ActiveRecord::Base
  belongs_to :character

  validates :name, presence: true
end
