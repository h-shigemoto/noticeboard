class Board < ApplicationRecord

  has_many :board_replies, dependent: :destroy
end
