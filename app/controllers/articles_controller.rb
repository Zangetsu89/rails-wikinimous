class ArticlesController < ApplicationController
  
  # before_action :article_find, only: [:show, :create, :edit, :update]
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.create(article_params)
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article.update(article_params)
    redirect_to articles_path
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to articles_path
  end


  private

  def article_params
    params.require(:article).permit(:title, :content)
    
  end

  #def article_find
    #@article = Article.find(params[:id]) 
  #end
end
