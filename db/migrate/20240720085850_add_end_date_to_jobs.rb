class AddEndDateToJobs < ActiveRecord::Migration[7.1]
  def change
    add_column :jobs, :end_date, :datetime
  end
end
