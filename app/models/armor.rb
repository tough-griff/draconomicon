# == Schema Information
#
# Table name: armors
#
#  id                   :integer          not null, primary key
#  character_id         :integer          not null
#  name                 :string           default(""), not null
#  category             :string           default("Light Armor"), not null
#  cost                 :string
#  armor_class          :integer
#  minimum_str          :integer
#  stealth_disadvantage :boolean
#  weight               :string
#  description          :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_armors_on_character_id  (character_id)
#

class Armor < ActiveRecord::Base
  include Inventoriable

  default_scope { order(created_at: :asc) }

  CATEGORIES = ["Light Armor", "Medium Armor", "Heavy Armor", "Shield"]

  validates :name, presence: true
  validates :category, presence: true, inclusion: CATEGORIES
end
