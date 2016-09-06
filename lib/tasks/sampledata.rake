namespace :sampledata do

  # sample board data
  SAMPLE_BOARDS = [ { id: -3, title: 'sample board 1', name: 'board name1', content: 'sample content 1.' },
    { id: -2, title: 'sample board 2', name: 'board name2', content: 'sample content 2.' },
    { id: -1, title: 'sample board 3', name: 'board name3', content: 'sample content 3.' }
  ]

  # sample board reply data
  SAMPLE_BOARD_REPLIES = [ { id: -9, board_id: -3, rep_no: 1, name: 'rep name1', content: 'sample reply 1.' },
    { id: -8, board_id: -3, rep_no: 2, name: 'rep name2', content: 'sample reply 2.' },
    { id: -7, board_id: -3, rep_no: 3, name: 'rep name3', content: 'sample reply 3.' },
    { id: -6, board_id: -2, rep_no: 1, name: 'rep name1', content: 'sample reply 1.' },
    { id: -5, board_id: -2, rep_no: 2, name: 'rep name2', content: 'sample reply 2.' },
    { id: -4, board_id: -2, rep_no: 3, name: 'rep name3', content: 'sample reply 3.' },
    { id: -3, board_id: -1, rep_no: 1, name: 'rep name1', content: 'sample reply 1.' },
    { id: -2, board_id: -1, rep_no: 2, name: 'rep name2', content: 'sample reply 2.' },
    { id: -1, board_id: -1, rep_no: 3, name: 'rep name3', content: 'sample reply 3.' }
  ]

  desc "generate sample board and reply data."
  task :generate => :environment do

    Board.create(SAMPLE_BOARDS)
    BoardReply.create(SAMPLE_BOARD_REPLIES)
  end

  desc "delete sample board and reply data."
  task :delete => :environment do

    Board.destroy_all('id < 0')
  end
end
