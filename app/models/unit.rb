class Unit < ActiveRecord::Base
  belongs_to :items
  
  has_many :collections, :foreign_key => :unit_id, :dependent => :destroy
  has_many :groups, :through => :collections, :source => :group, :dependent => :destroy

  has_many :events, :through => :groups
  
end
