class AddPreviewMigrationTest2 < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :test_col3, :string
  end
end
