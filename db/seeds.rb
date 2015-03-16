if ENV["RAILS_ENV"] == "development"
  puts "Seeding data..."
  require "ffaker"

  CLASSES = %i(bbn brd clr drd ftr mnk pal rgr rog src wiz)
  RACES = %w(Human Dwarf Elf Gnome Half-Elf Half-Orc Halfling Drow)

  if Rails.env == "development"
    admin = User.new do |u|
      u.name = "tough griff"
      u.email = "gryphon92@gmail.com"
      u.password = "password"
      u.password_confirmation = "password"
      u.admin = true
    end
    admin.skip_confirmation!
    admin.save!

    39.times do |n|
      user = User.new do |u|
        u.name = "#{Faker::Internet.user_name}"
        u.email = "example-#{n + 1}@railstutorial.org"
        u.password = "password"
        u.password_confirmation = "password"
      end
      user.skip_confirmation!
      user.save!
    end

    users = User.limit(5)
    users.each do |user|
      3.times do
        character = user.characters.build do |c|
          c.name = Faker::Name.first_name
          c.class_levels = { CLASSES.sample => rand(1..20) }
          c.player_name = user.name
          c.race = RACES.sample
          c.alignment = Character::ALIGNMENTS.sample
        end
        character.save!
      end
    end
  end
else
  puts "Skipping seed data."
end
