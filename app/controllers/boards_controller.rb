class BoardsController < ApplicationController
  def new
    @board = Board.new
  end

  def index
    @boards = Board.all
    render "boards/index"
  end

  def create
      # データはparamsという変数に渡されてくる
      # create は、Postモデルのクラスメソッド
      Board.create(board_params)

      @board = Board.new(content:params[:content])

      if @board.save
        redirect_to boards_path, success: '投稿に成功しました'
      else
        flash.now[:danger] = "投稿に失敗しました"
        render :new
      end
  end

  def show
    @boaredt = Board.find_by(id:params[:id])
  end

  private
  # paramsから欲しいデータのみ抽出
  def board_params
      params.require(:board).permit(:name, :title, :content)
  end

  def destroy
   board = Board.find(params[:id])
    if board.user_id == current_user.id
     board.destroy #destroyメソッドを使用し対象のツイートを削除する。
    end
  end
end
