class AddResumeToApplications < ActiveRecord::Migration[7.1]
  def change
    add_column :applications, :resume, :binary
  end
end
