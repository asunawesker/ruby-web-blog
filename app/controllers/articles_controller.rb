class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  # The new action instantiates a new article, but does not save it. This article will be used in the view when
  # building the form.
  def new
    @article = Article.new
  end

  # The create action instantiates a new article with values for the title and body, and attempts to save it. If the
  # article is saved successfully, the action redirects the browser to the article's page. Else, the action redisplays
  # the form by rendering app/views/articles/new.html.erb with status code 422 Unprocessable Entity.
  def create
    @article = Article.new(article_params)

    if @article.save
      # redirect_to will cause the browser to make a new request,
      redirect_to @article
    else
      # render renders the specified view for the current request.
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def updated
    @article = Article.find(params[:id])

    if @article.updated(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # The destroy action fetches the article from the database, and calls destroy on it. Then, it redirects the browser
  # to the root path with status code 303
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
