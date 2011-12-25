class Group < ActiveRecord::Base
  has_many :collections, :foreign_key => :group_id, :dependent => :destroy
  has_many :children, :through => :collections, :source => :unit, :dependent => :destroy
  
  def units
    self.children
  end
  
  def unit?(id)
    self.collections.each do |c|
      if c.unit_id == id
        return c.id
      end
    end
    return false
  end
end
