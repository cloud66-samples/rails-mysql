class AddTestCol7ToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :test_col7, :string
  end
end
