class AddPersonalMessageToApplications < ActiveRecord::Migration[7.1]
  def change
    add_column :applications, :personal_message, :string
  end
end
