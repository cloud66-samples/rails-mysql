class AddPreviewMigrationTest4 < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :test_col5, :string
  end
end
