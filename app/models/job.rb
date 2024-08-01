class Job < ApplicationRecord
  validates :title, :description, :company_name, :location, :price, presence: true
  has_many :applications
  belongs_to :user
end
