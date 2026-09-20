class ArticlesController < ApplicationController

    def show
        # if i use @article = Article.find_by(id: params[:id]) it will return nil
        # if i use @article = Article.find(params[:id]) it will return the respective id (if exists) or an error
        # if i have to use this article in template i have to use instance variable
        # binding.break # Stops the execution and lets you debug
        @article = Article.find(params[:id]) 
    end
end