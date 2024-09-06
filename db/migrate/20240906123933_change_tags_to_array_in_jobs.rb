class ChangeTagsToArrayInJobs < ActiveRecord::Migration[7.1]
  def change
    change_column :jobs, :tags, 'text[] USING (string_to_array(tags, \',\'))'
  end
end
