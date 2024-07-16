class AddPriceToJobs < ActiveRecord::Migration[7.1]
  def change
    add_column :jobs, :price, :integer
  end
end
