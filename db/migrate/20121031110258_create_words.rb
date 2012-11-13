class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
			t.string :english
			t.string :romaji
			t.string :japanese
      t.timestamps
    end
  end
end
