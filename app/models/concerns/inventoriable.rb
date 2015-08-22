module Inventoriable
  extend ActiveSupport::Concern

  included do
    belongs_to :character
  end
end
