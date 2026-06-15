class AddPreviewMigrationTest2 < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :test_col3, :string
  end
end
