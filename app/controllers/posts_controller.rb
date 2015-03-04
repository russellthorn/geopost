class PostsController < ApplicationController
  before_action :find_post, except: [:index, :new, :create]
  # could also write - before_action :find_post, :except => [:index, :new, :create]

  def index
    # active record gives us Post.all see app/models/post.rb

    if params[:featured].present? and params[:featured] == "true"
      # GET only featured the posts from posts table in the DB
      @posts = Post.where(is_featured: true).order("created_at DESC") # order defaults to ALL posts.. DESC = descending
    else
      # GET all the posts from posts table in the DB
      @posts = Post.order("created_at DESC") # order defaults to ALL posts.. DESC = descending
    end
  end

  def show
    # GET the post with the id from the URL.
    # @post = Post.find(params[:id])
    @comments = @post.comments.order("created_at DESC")
  end


  # the new form gets submitted to the create action below it
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:success] = "good work"
      redirect_to root_path
    else
      flash[:error] = "fix up your shit"
      render :new
    end
  end


  # the edit form gets submitted to the update action below it
  def edit
    # @post = Post.find(params[:id])
  end

  def update
    # @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "\"#{@post.title}\" was updated."
      redirect_to post_path(@post)
    else
      render :edit
    end
  end


  def destroy
    # @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  private
  def post_params
    # allow attributes that I trust, ignore unsanctioned data to post to DB
    params.require(:post).permit(:title, :body, :is_published, :is_featured)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
