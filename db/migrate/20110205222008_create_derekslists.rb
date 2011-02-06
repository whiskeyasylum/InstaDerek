class CreateDerekslists < ActiveRecord::Migration
  def self.up
    create_table :derekslists do |t|
      t.string :photo_id
      t.string :user_id
			t.string :twitter_handle
      t.text :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :derekslists
  end
end
