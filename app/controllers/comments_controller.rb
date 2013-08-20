class CommentsController < ApplicationController
  def index
    @commentable = find_commentable
    @comments = @commentable.comments
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      redirect_to @comment, :notice => "Successfully created comment."
    else
      render :action => 'new'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      redirect_to @comment, :notice  => "Successfully updated comment."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_url, :notice => "Successfully destroyed comment."
  end

  private

  def find_commentable
    params.each do |name, value|
      if name =~/(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
