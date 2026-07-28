require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  test "fixtures load" do
    assert_equal 2, Article.count
  end

  test "persists a title and text" do
    article = Article.create!(title: "A title", text: "Some text")

    assert_equal "A title", article.reload.title
    assert_equal "Some text", article.text
  end
end
