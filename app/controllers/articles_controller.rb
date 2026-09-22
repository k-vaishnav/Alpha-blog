class ArticlesController < ApplicationController
    def show
        # if i use @article = Article.find_by(id: params[:id]) it will return nil
        # if i use @article = Article.find(params[:id]) it will return the respective id (if exists) or an error
        # if i have to use this article in template i have to use instance variable
        # binding.break # Stops the execution and lets you debug
        @article = Article.find(params[:id]) 
    end
    def index 
        @articles = Article.all
    end
    def new 
        @article = Article.new
    end
    def create
        @article = Article.new(article_params)
        # render plain: @article.inspect
        if @article.save
            flash[:notice] = "Article was successfully created."
            redirect_to @article  # or redirect_to article_path(@article)
        # render plain: params[:article]
        else 
            render 'new'
        end

    end
    private
    def article_params
        # params.require(:article).permit(:title, :description)
        params.expect(article:[:title,:description])
    end
end