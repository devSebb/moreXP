class AddStartDateToJobs < ActiveRecord::Migration[7.1]
  def change
    add_column :jobs, :start_date, :datetime
  end
end
