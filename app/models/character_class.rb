# == Schema Information
#
# Table name: character_classes
#
#  id           :integer          not null, primary key
#  name         :string           default(""), not null
#  abbreviation :string(3)        default(""), not null
#  slug         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_character_classes_on_slug  (slug) UNIQUE
#

class CharacterClass < ActiveRecord::Base
  extend FriendlyId

  default_scope { order(abbreviation: :asc) }

  validates :name, presence: true
  validates :abbreviation, presence: true, uniqueness: true,
                           format: /\A[a-z]{3}\Z/, length: { is: 3 }

  before_validation :downcase_abbreviation

  friendly_id :abbreviation

  private

  def downcase_abbreviation
    self.abbreviation = abbreviation.downcase if attribute_present?(:abbreviation)
  end
end
