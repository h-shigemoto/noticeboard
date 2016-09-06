class BoardReply < ApplicationRecord

  belongs_to :board

  validates :name, presence: true, length: {maximum: 50}
  validates :content, length: {maximum: 200}, if: "content.present?"

  # get max reply no.
  # @param [integer] board_id parent board id
  # @return [integer] reply no
  def self.get_max_rep_no(board_id)

    # get max rep_no.
    max_rep_no = BoardReply.where(board_id: board_id).maximum('rep_no')
    # if no reply, rep_no = 1.
    return 1 if max_rep_no.nil?
    # if sampledata only, rep_no = 1.
    return 1 if max_rep_no < 0

    max_rep_no + 1
  end
end
