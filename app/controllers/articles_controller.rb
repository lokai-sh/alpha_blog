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

  def edit
    @article = Article.find(params[:id])
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
      render 'new' #If errors re-render to see the errors
    end

    #can shorten the above to    redirect_to @article
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description)) #update using the values from the form
      flash[:notice] = "Article was created successfully."
      redirect_to @article
    else
      render 'edit' #If errors re-render the form to see the errros
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

end
