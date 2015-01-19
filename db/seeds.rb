require "ffaker"

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
      u.name = Faker::Internet.user_name
      u.email = "example-#{n + 1}@railstutorial.org"
      u.password = "password"
      u.password_confirmation = "password"
    end
    user.skip_confirmation!
    user.save!
  end
end
