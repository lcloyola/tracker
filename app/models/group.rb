class Group < ActiveRecord::Base
  has_many :collections, :foreign_key => :group_id, :dependent => :destroy
  has_many :units, :through => :collections, :source => :unit, :dependent => :destroy
  
  has_many :packages, :foreign_key => :group_id, :dependent => :destroy
  has_many :events, :through => :packages, :source => :event, :dependent => :destroy
    
  def unit?(id)
    self.collections.each do |c|
      if c.unit_id == id
        return c.id
      end
    end
    return false
  end
end
