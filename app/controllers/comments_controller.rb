class CommentsController < ApplicationController
  before_action :find_post, only: [:new, :create, :edit, :update]

  def new
    # @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    # @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      flash[:success] = "thanks for commenting"
      redirect_to post_path(@post)
    else
      flash[:error] = "numpty"
      render :new
    end
  end

  def edit
    @comment = @post.comments.find(params[:id])
  end

  def update
    @comment = @post.comments.find(params[:id])
    if @comment.update(comment_params)
      flash[:success] = "updated"
      redirect_to post_path(@post)
    else
      flash[:error] = "try again"
      render :edit
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
