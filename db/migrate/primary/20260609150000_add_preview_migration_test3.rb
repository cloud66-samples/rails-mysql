class AddPreviewMigrationTest3 < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :test_col4, :string
  end
end
