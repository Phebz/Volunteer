class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :organizations, dependent: :nullify
  has_many :missions, dependent: :nullify

  belongs_to :organization, optional: true
  
  validates :user_type, presence: true, inclusion: { in: %w(admin_organization user_organization volunteer) }

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
