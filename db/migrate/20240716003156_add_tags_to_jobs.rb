class AddTagsToJobs < ActiveRecord::Migration[7.1]
  def change
    add_column :jobs, :tags, :string
  end
end
