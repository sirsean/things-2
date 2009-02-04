class AddTestThings < ActiveRecord::Migration
  def self.up
    Thing.create(:text => "First thing")
    Thing.create(:text => "Second thing")
    Thing.create(:text => "Third thing")
  end

  def self.down
    Thing.delete_all
  end
end
