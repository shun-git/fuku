class TestsController < ApplicationController
  def new
  end

  def index
    render "tests/tests"
  end
end
