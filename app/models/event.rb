class Event < ActiveRecord::Base
  has_many :packages, :foreign_key => :event_id, :dependent => :destroy
  has_many :groups, :through => :packages, :source => :group, :dependent => :destroy
  has_many :units, :through => :groups
  
end
