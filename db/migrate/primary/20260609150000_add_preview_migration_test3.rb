class AddPreviewMigrationTest3 < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :test_col4, :string
  end
end
