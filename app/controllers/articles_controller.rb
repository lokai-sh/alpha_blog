class ArticlesController < ApplicationController
  #Show the article with id = parameter (id)
  def show #This method definition will call the articles/show.html.erb file and display the contents (which can be html with ruby embedded)
    #Turn this into an instance variable so it is available to the view
    #byebug
    @article = Article.find(params[:id])
  end

  #list of articles
  def index 
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  #Create new article
  def create
    #render plain: params[:article] # this will render (display) the value of params specifically returning the article parameter
    @article = Article.new(params.require(:article).permit(:title, :description))
    
    #render plain: @article #This will display the article object on the screen
    #render plain: @article.inspect #This will display the article object values on the screen
    
    #save this to the articles table in the database
    if @article.save
      flash[:notice] = "Article was created successfully."

      #redirect to now display the new article
      redirect_to article_path(@article)
    else
      render 'new' #<-- When there are errors we want to re-render the new form and the errors will be displayed
    end

    #can shorten the above to    redirect_to @article
  end
end
