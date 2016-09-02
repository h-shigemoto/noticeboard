class CreateBoardReplies < ActiveRecord::Migration[5.0]
  def change
    # create board_reply table.
    create_table :board_replies do |t|
      t.references :board
      t.integer :rep_no
      t.string :name, :null => false, :limit => 50, :default => 'No Name'
      t.text :content
      t.timestamps
    end
  end
end
