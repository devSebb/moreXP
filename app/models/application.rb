class Application < ApplicationRecord
  has_one_attached :cover_letter
  has_one_attached :resume
  belongs_to :user
  belongs_to :job
end
