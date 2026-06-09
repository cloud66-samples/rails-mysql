class AddPreviewMigrationTest < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :test_col, :string
  end
end
