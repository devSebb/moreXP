class AddForeignKeyWithCascadeToBookmarks < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :bookmarks, :jobs
    add_foreign_key :bookmarks, :jobs, on_delete: :cascade
  end
end
