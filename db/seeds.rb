if Rails.env.development? || Rails.env.staging?
  require "ffaker"

  puts "Seeding database..."

  CLASSES = %i(bbn brd clr drd ftr mnk pal rgr rog src wiz)
  RACES = %w(Human Dwarf Elf Gnome Half-Elf Half-Orc Halfling Drow)

  # === Users & Admin ===
  admin = User.new do |u|
    u.name = "tough griff"
    u.email = "gryphon92@gmail.com"
    u.password = "password"
    u.password_confirmation = "password"
    u.admin = true
  end
  admin.skip_confirmation!
  admin.save!
  print "."

  39.times do |n|
    user = User.new do |u|
      u.name = FFaker::Internet.user_name
      u.email = "example-#{n + 1}@railstutorial.org"
      u.password = "password"
      u.password_confirmation = "password"
    end
    user.skip_confirmation!
    user.save!
    print "."
  end

  # === Characters ===
  users = User.limit(5)
  users.each do |user|
    3.times do
      character = user.characters.build do |c|
        c.name = FFaker::Name.first_name
        c.class_levels = { CLASSES.sample => rand(1..20) }
        c.player_name = user.name
        c.race = RACES.sample
        c.alignment = Character::ALIGNMENTS.sample
      end
      character.save!
      print "."
    end
  end

  # === Character Items ===
  character = Character.first
  weapon = character.weapons.build do |w|
    w.name = "Dagger"
    w.category = "simple"
    w.classification = "melee"
    w.cost = "2 gp"
    w.damage = "1d4"
    w.damage_type = "piercing"
    w.weight = "1 lb."
    w.properties = ["finesse", "light", "thrown (20/60)"]
  end
  weapon.save!
  print "."

  armor = character.armors.build do |a|
    a.name = "Padded Armor"
    a.category = "Light Armor"
    a.cost = "5 gp"
    a.armor_class = 11
    a.stealth_disadvantage = false
    a.weight = "8 lb."
  end
  armor.save!
  print "."

  puts
else
  puts "Skipping seed data."
end
