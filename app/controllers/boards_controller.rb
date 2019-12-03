class BoardsController < ApplicationController
  def new
    @board = Board.new
  end

  def index
#    render "boards/index"
  end
end
