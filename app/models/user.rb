class User < ApplicationRecord
  has_secure_password
  has_many :products, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :role, presence: true, inclusion: { in: %w[merchant customer] }

  def merchant?
    role == 'merchant'
  end
end
