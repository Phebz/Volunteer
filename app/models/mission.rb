class Mission < ApplicationRecord
  belongs_to :organization, polymorphic: true
end
