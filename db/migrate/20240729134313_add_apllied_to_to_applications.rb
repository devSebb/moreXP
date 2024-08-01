class AddAplliedToToApplications < ActiveRecord::Migration[7.1]
  def change
    add_column :applications, :applied_to, :boolean, default: false
  end
end
