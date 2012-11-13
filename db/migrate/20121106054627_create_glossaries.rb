class CreateGlossaries < ActiveRecord::Migration
  def change
    create_table :glossaries do |t|
    	t.string :glossary
      t.timestamps
    end

    change_table :words do |t|
    	t.references :glossary
    end
  end
end
