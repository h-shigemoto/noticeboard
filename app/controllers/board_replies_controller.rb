class BoardRepliesController < ApplicationController
  before_action :set_board_reply, only: [:edit, :update, :destroy]

  # GET /board_replies/1/edit
  def edit
  end

  # POST /board_replies
  # POST /board_replies.json
  def create
    @board_reply = BoardReply.new(board_reply_params)

    if @board_reply.save
      redirect_to @board_reply, notice: 'Board reply was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /board_replies/1
  # PATCH/PUT /board_replies/1.json
  def update
    if @board_reply.update(board_reply_params)
      redirect_to @board_reply, notice: 'Board reply was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /board_replies/1
  # DELETE /board_replies/1.json
  def destroy
    @board_reply.destroy
    redirect_to board_replies_url, notice: 'Board reply was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board_reply
      @board_reply = BoardReply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_reply_params
      reply_params = params.require(:board_reply).permit(:name, :content)
      reply_params[:rep_no] = BoardReply.get_max_rep_no
      reply_params
    end
end
