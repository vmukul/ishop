class CreateLists < ActiveRecord::Migration
  def self.up
    create_table :lists do |t|
      t.date :crdate
      t.string :store
      t.string :item
      t.string :qty
      t.boolean :mdone
      t.boolean :mdel
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :lists
  end
end
