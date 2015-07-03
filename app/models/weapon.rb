# == Schema Information
#
# Table name: weapons
#
#  id             :integer          not null, primary key
#  character_id   :integer
#  name           :string           default(""), not null
#  category       :string           default("simple"), not null
#  classification :string           default("melee"), not null
#  cost           :string
#  attack_bonus   :integer
#  damage         :string
#  damage_type    :string
#  weight         :string
#  properties     :text
#  description    :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_weapons_on_character_id  (character_id)
#

class Weapon < ActiveRecord::Base
  CATEGORIES = %w(simple martial)
  CLASSIFICATIONS = %w(melee ranged)

  belongs_to :character

  validates :name, presence: true
  validates :category, presence: true, inclusion: CATEGORIES
  validates :classification, presence: true, inclusion: CLASSIFICATIONS

  serialize :properties, Array
end
