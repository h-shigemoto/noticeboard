class BoardReply < ApplicationRecord

  belongs_to :board

  # get max reply no.
  # @return [integer] reply no
  def get_max_rep_no

    # get max rep_no.
    max_rep_no = BoardReply.find(self.board_id).maximum('rep_no')
    # if no reply, rep_no = 1.
    return 1 if max_rep_no.nil?
    # if sampledata only, rep_no = 1.
    return 1 if max_rep_no < 0

    max_rep_no + 1
  end
end
