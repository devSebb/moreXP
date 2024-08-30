class User < ApplicationRecord
  has_many :applications
  has_many :bookmarks
  has_many :jobs
  has_one_attached :photo
  validates :email, presence: true, uniqueness: true
  # validates :password, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessor :current_password

  enum role: { customer: "customer", employer: "employer", admin: "admin" }
end
