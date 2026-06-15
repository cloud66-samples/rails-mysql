class AddTestCol6ToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :test_col6, :string
  end
end
