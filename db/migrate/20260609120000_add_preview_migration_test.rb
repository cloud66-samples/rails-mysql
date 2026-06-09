class AddPreviewMigrationTest < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :test_col2, :string
  end
end
