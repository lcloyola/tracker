class Unit < ActiveRecord::Base
  belongs_to :items
  
  has_many :collections, :foreign_key => :unit_id, :dependent => :destroy

  def groups
    self.collections
  end
end
