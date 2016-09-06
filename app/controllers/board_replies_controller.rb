class BoardRepliesController < ApplicationController
  before_action :set_board_reply, only: [:edit, :update, :destroy]

  # GET /board_replies/1/edit
  def edit
    @board = @board_reply.board
  end

  # POST /board_replies
  def create
    @board_reply = BoardReply.new(board_reply_params)
    @board_reply.board_id = params[:board_id]

    if @board_reply.save
      redirect_to @board_reply.board, notice: 'Board reply was successfully created.'
    else
      redirect_to @board_reply.board, alert: @board_reply.errors.full_messages
    end
  end

  # PATCH/PUT /board_replies/1
  def update
    if @board_reply.update(board_reply_params)
      redirect_to @board_reply.board, notice: 'Board reply was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /board_replies/1
  def destroy
    board = @board_reply.board
    @board_reply.destroy
    redirect_to board, notice: 'Board reply was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board_reply
      @board_reply = BoardReply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_reply_params
      reply_params = params.require(:board_reply).permit(:name, :content)
      reply_params[:rep_no] = BoardReply.get_max_rep_no(params[:board_id]) unless @board_reply.present?
      reply_params
    end
end
