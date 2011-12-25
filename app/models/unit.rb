class Unit < ActiveRecord::Base
  belongs_to :items
  
  has_many :collections, :foreign_key => :unit_id, :dependent => :destroy
  has_many :parents, :through => :reverse_collections, :source => :group, :dependent => :destroy
  
  def groups
    self.parents
  end
end
