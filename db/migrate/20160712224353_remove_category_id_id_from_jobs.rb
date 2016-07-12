class RemoveCategoryIdIdFromJobs < ActiveRecord::Migration[5.0]
  def change
    remove_column :jobs, :category_id_id, :integer
  end
end
