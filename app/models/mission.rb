class Mission < ApplicationRecord
  belongs_to :organization, polymorphic: true
  belongs_to :user, optional: true
  
  has_many :working_days, dependent: :destroy
end
