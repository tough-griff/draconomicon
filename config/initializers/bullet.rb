unless Rails.env.production?
  Rails.application.config.after_initialize do
    Bullet.enable = true
    Bullet.bullet_logger = true

    Bullet.raise = true if Rails.env.test?
  end
end
