class Board < ApplicationRecord

  has_many :board_replies, dependent: :destroy

  # search boards by title
  # @param [String] title search target title
  # @return [Board] search result
  def get_by_title(title)

    return nil if title.present?

    Board.where("title like '%#{title}%'")
  end
end
