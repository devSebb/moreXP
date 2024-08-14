class Job < ApplicationRecord
  validates :title, :description, :company_name, :location, :price, :industry, presence: true
  has_many :applications, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  belongs_to :user

  INDUSTRY_COLORS = {
    "Software Development" => '#f5f3c4',
    "Finance & Accounting" => '#c4dcf5',
    "Architecture" => '#c4f5c6',
    "Marketing & Graphic Design" => '#f5c4e1',
    "Photography" => '#c4c6f5',
    "Video & Film" => '#c4f5c5',
    "Fashion" => '#f5dac4'
  }
end
