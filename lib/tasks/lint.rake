unless Rails.env.production?
  require "haml_lint/rake_task"
  require "rubocop/rake_task"
  require "scss_lint/rake_task"

  puts

  HamlLint::RakeTask.new do |t|
    t.files = ["app/views"]
  end

  RuboCop::RakeTask.new

  SCSSLint::RakeTask.new do |t|
    t.files = ["app/assets/stylesheets"]
  end

  desc "Run all linters -- rubocop, scss_lint and haml_lint"
  task lint: [:rubocop, :scss_lint, :haml_lint]
end
