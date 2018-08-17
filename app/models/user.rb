class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  has_many :interests
  has_many :user_areas
  has_many :areas, through: :user_areas
  has_many :rides, through: :interests
  # has_secure_password
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true, format: {
    with: /\A[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/,
    message: 'must be valid',
  }
  # validates :password, presence: true, length: { minimum: 6 }, format: {
  #   with: /\A^(?=.*\d)(?=.*[a-zA-Z])[a-zA-Z\d]{5,50}\z/,
  #   message: 'must be an alphanumeric',
  # }
end
