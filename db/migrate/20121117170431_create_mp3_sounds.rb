class CreateMp3Sounds < ActiveRecord::Migration
  def change
    create_table :mp3_sounds do |t|
    	t.binary :sound
      t.timestamps
    end

    add_column :words, :mp3_sound_id, :int
  end
end
