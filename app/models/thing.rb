class Thing < ActiveRecord::Base
  validates_presence_of :text
  
  def self.get_things(limit = 10)
    Thing.find(:all, :order => "created_at desc", :limit => limit)
  end
  
  def self.get_things_after(date)
    Thing.find(:all,
      :conditions => [ "created_at >= :date", { :date => date } ],
      :order => "created_at desc"
    )
  end
end
