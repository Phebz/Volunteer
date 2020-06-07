class Organization < ApplicationRecord
  belongs_to :user, polymorphic: true
end
