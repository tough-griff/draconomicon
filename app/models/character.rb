# == Schema Information
#
# Table name: characters
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  name         :string           default(""), not null
#  slug         :string           not null
#  class_levels :text
#  background   :string
#  player_name  :string
#  race         :string
#  alignment    :string           default("True Neutral"), not null
#  experience   :integer          default(0)
#  age          :integer
#  height       :string
#  weight       :string
#  eyes         :string
#  skin         :string
#  hair         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_characters_on_slug     (slug)
#  index_characters_on_user_id  (user_id)
#

class Character < ActiveRecord::Base
  extend FriendlyId

  default_scope { order(created_at: :asc) }

  ALIGNMENTS = [
    "Lawful Good", "Neutral Good", "Chaotic Good",
    "Lawful Neutral", "True Neutral", "Chaotic Neutral",
    "Lawful Evil", "Neutral Evil", "Chaotic Evil"
  ]

  # TODO: validate user entered classes and levels
  CLASS_DESCRIPTION_REGEX = %r{\A((\w{3} \d+)/?)+\Z}

  belongs_to :user

  has_many :armors
  has_many :items
  has_many :weapons

  validates :name, presence: true
  validates :alignment, presence: true, inclusion: ALIGNMENTS

  serialize :class_levels, Hash

  friendly_id :name, use: :scoped, scope: :user

  # Returns the total of all a character's classes' levels.
  def character_level
    class_levels.values.reduce(:+)
  end

  # TODO: allow image upload, store url in db
  # Return the URL of a character's avatar.
  def image_url
    "https://raw.githubusercontent.com/thoughtbot/refills/master/source/images/mountains.png"
  end

  # Return a string describing the character's alignment, race, and classes.
  def description
    "#{alignment_abbreviation} #{race} #{class_description}"
  end

  def to_s
    return name if race.blank? || class_description.blank?
    "#{name} (#{description})"
  end

  private

  # Returns the two-character abbreviation of a character's alignment
  def alignment_abbreviation
    alignment.split(" ").map(&:chr).join
  end

  # Return a string representation of a character's classes and levels
  def class_description
    class_levels.map { |k, v| "#{k.capitalize} #{v}" }.join("/")
  end

  # TODO: get this working
  # Parses the string representation of a character's classes and levels
  def parse_class_description(description)
    Hash[description.split("/").map { |str| str.downcase.split }]
  end
end
