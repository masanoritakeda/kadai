class CommentsController < ApplicationController
  def edit
    @blog = Blog.find(params[:blog_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:blog_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to blog_path(@blog), notice: "コメントを編集しました"
    else
      flash.now[:danger] = "編集に失敗しました"
      render 'edit'
    end
  end
  
  
  def create
    @blog = Blog.find(params[:blog_id])
    @comment = current_user.comments.new(comment_params)
    
    @comment.save
    redirect_to blog_path(@blog)
  end

  def destroy
    Comment.find(params[:id]).destroy
    Comment.find_by(id: params[:id], blog_id: params[:blog_id])
    redirect_to blog_path(params[:blog_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, blog_id: params[:blog_id])
  end
end
