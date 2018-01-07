class User < ApplicationRecord
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, presence: true, length: { in: 2..40 }
  validates :email, presence: true, uniqueness: true, length: { in: 2..40 }, format: { with: EMAIL_REGEX }
  validates :alias, presence: true, length: { in: 2..40 }

  has_many :ideas
  has_many :likes, dependent: :destroy
  has_many :liked_ideas, through: :likes, source: :idea


  before_save :email_lowercase

  def email_lowercase
    email.downcase!
  end

end
