class CreateBoards < ActiveRecord::Migration[5.0]
  def change
    # create board table.
    create_table :boards do |t|
      t.string :title, :null => false, :limit => 50
      t.string :name, :null => false, :limit => 50, :default => 'No Name'
      t.text :content
      t.timestamps
    end
  end
end
