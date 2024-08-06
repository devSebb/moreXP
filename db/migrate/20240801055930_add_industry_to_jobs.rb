class AddIndustryToJobs < ActiveRecord::Migration[7.1]
  def change
    add_column :jobs, :industry, :string
  end
end
