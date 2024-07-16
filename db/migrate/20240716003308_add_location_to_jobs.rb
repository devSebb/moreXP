class AddLocationToJobs < ActiveRecord::Migration[7.1]
  def change
    add_column :jobs, :location, :string
  end
end
