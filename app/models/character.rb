# == Schema Information
#
# Table name: characters
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  name            :string           default(""), not null
#  slug            :string           not null
#  class_and_level :text
#  background      :string
#  player_name     :string
#  race            :string
#  alignment       :string           default("True Neutral"), not null
#  experience      :integer          default("0")
#  age             :integer
#  height          :string
#  weight          :string
#  eyes            :string
#  skin            :string
#  hair            :string
#  created_at      :datetime
#  updated_at      :datetime
#
# Indexes
#
#  index_characters_on_user_id  (user_id)
#

class Character < ActiveRecord::Base
  ALIGNMENTS = [
    "Lawful Good", "Neutral Good", "Chaotic Good",
    "Lawful Neutral", "True Neutral", "Chaotic Neutral",
    "Lawful Evil", "Neutral Evil", "Chaotic Evil"
  ]

  belongs_to :user

  extend FriendlyId
  friendly_id :name, use: :scoped, scope: :user

  validates :name, presence: true
  validates :alignment, presence: true, inclusion: ALIGNMENTS

  # TODO
  def image
    '<img src="https://raw.githubusercontent.com/thoughtbot/refills/master/source/images/mountains.png">'.html_safe
  end

  def description
    "#{alignment_abbreviation} #{race} #{class_and_level}"
  end

  def to_s
    return name if race.blank? || class_and_level.blank?
    "#{name} (#{description})"
  end

  private

  def alignment_abbreviation
    alignment.split(" ").map(&:chr).join
  end
end
