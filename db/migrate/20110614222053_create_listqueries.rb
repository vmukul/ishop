class CreateListqueries < ActiveRecord::Migration
  def self.up
    create_table :listqueries do |t|
      t.string :sfield
      t.string :soper
      t.string :svalue
      t.string :sbind
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :listqueries
  end
end
