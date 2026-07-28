require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
  end

  test "should get index" do
    get articles_url
    assert_response :success
  end

  test "should get new" do
    get new_article_url
    assert_response :success
  end

  test "should show article" do
    get article_url(@article)
    assert_response :success
    assert_select "p", /#{@article.title}/
  end

  test "should create article" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { title: "A title", text: "Some text" } }
    end

    assert_redirected_to article_url(Article.last)
  end

  # Params that are not wrapped in the expected `article` key must be rejected
  # outright rather than silently dropped, which is what `params.expect` gives us.
  test "should reject article params outside the expected key" do
    assert_no_difference("Article.count") do
      post articles_url, params: { title: "A title", text: "Some text" }
    end

    assert_response :bad_request
  end
end
