class Application < ApplicationRecord
  has_one_attached :cover_letter
  has_one_attached :resume
  belongs_to :user
  belongs_to :job

  after_create :set_applied_to

  private

  def set_applied_to
    update_column(:applied_to, true)
  end
end
