class CreateThings < ActiveRecord::Migration
  def self.up
    create_table :things do |t|
      t.column :text, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :things
  end
end
