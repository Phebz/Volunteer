# frozen_string_literal: true

# Simple class for User, could be either an admin for an organization
# a user for a organization or simply a volunteer
# Powered by Devise
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :organizations, dependent: :nullify
  has_many :missions, dependent: :nullify

  belongs_to :organization, optional: true

  validates :first_name, presence: true, case_sensitive: false, uniqueness: true
  validates :last_name, presence: true, case_sensitive: false, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  TYPE_OF_USER = %w[admin_organization user_organization volunteer].freeze

  validates :user_type, presence: true, inclusion: { in: TYPE_OF_USER }

  def full_name
    "#{first_name} #{last_name}"
  end
end

