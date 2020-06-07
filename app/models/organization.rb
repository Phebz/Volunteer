class Organization < ApplicationRecord
  belongs_to :user, optional: true

  has_many :users, dependent: :nullify
  has_many :mission, dependent: :destroy
end
