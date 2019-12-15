class PostsController < ApplicationController
  def index
    @posts = Post.all
    render "posts/index"
  end

  def new
    @post = Post.new
    render "posts/new"
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.update(title: params[:title], description: params[:description])

    redirect_to("/posts/index")
  end

  def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to("/posts/index")
  end

  private
  def post_params
    params.require(:post).permit(:title, :image, :description)
  end
end
