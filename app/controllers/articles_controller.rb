class ArticlesController < ApplicationController
  def show #This method definition will call the articles/show.html.erb file and display the contents (which can be html with ruby embedded)
    #Turn this into an instance variable so it is available to the view
    byebug
    @article = Article.find(params[:id])
  end
end
