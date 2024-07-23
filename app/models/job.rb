class Job < ApplicationRecord
  validates :title, :description, :company_name, :location, :price, presence: true
  belongs_to :user
end
