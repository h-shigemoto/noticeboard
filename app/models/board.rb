class Board < ApplicationRecord

  has_many :board_replies, dependent: :destroy

  validates :title, presence: true, length: {maximum: 100}
  validates :name, presence: true, length: {maximum: 50}
  validates :content, length: {maximum: 200}, if: "content.present?"

  # search boards by title
  # @param [String] title search target title
  # @return [Board] search result
  def self.get_by_title(title)
    Board.where("title like ?", "%#{title}%")
  end
end
