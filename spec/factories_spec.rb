require "support/database_cleaner.rb"

RSpec.describe "Factories" do
  specify "are in good condition" do
    expect { FactoryGirl.lint }.not_to raise_error
  end
end
