class AddAplliedToToApplications < ActiveRecord::Migration[7.1]
  def change
    add_column :applications, :applied_to, :boolean
  end
end
