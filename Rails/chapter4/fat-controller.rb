# A fat controller typically includes business logic that properly belongs in the model.

class ArticlesController < ApplicationController 
  def create 
    @article = Article.new(params[:article]) 
    @article.reporter_id = current_user.id
  begin 
    Article.transaction do 
      @version = @article.create_version!(params[:version]
                                          , current_user) 
    end 
  rescue 
    ActiveRecord::RecordNotSaved, 
    ActiveRecord::RecordInvalid 
    render :action => :index and return false
  end 
  redirect_to article_path(@article)
end
"""
A record not being found, or a record being invalid because of user input, in most web applications, is not an exceptional circumstance 
and therefore should be handled a little more gracefully. 
Used as flow control, these exceptions are little more than glorified GOTO statements
"""
## The above code in ideal world without exception handling
class ArticlesController < ApplicationController 
  def create 
    @article = Article.new(params[:article]) 
    @article.reporter_id = current_user.id
    if @article.save 
      redirect_to article_path(@article) 
    else 
      render :action => :new 
    end 
  end
end