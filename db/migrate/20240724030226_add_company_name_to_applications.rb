class AddCompanyNameToApplications < ActiveRecord::Migration[7.1]
  def change
    add_column :applications, :company_name, :string
  end
end
