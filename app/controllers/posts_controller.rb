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

  private
  def post_params
    params.require(:post).permit(:title, :image, :description)
  end

  def destroy
   post = Post.find(params[:id])
    if post.user_id == current_user.id
     post.destroy #destroyメソッドを使用し対象のツイートを削除する。
    end
  end
end
