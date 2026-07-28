class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params.expect(:id))
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article, notice: "Article was successfully created."
    else
      render :new, status: :unprocessable_content
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def article_params
      params.expect(article: [ :title, :text ])
    end
end
