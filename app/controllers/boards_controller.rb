class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  # GET /boards
  def index
    @boards = Board.all
  end

  # GET /boards/1
  def show
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/1/edit
  def edit
  end

  # GET /boards/search
  def search

    # get boards by title.
    target_boards = Board.get_by_title(params[:search_title])

    # set display boards
    if target_boards.present?
      @board = Board.all
    else
      @board = target_boards
    end

    render :index
  end

  # POST /boards
  def create
    @board = Board.new(board_params)

    if @board.save
      redirect_to @board, notice: 'Board was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /boards/1
  def update
    if @board.update(board_params)
      redirect_to @board, notice: 'Board was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /boards/1
  def destroy
    @board.destroy
    respond_to do |format|
      redirect_to boards_url, notice: 'Board was successfully destroyed.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_params
      params.require(:board).permit(:title, :name, :content)
    end
end
