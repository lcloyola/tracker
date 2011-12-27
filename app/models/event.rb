class Event < ActiveRecord::Base
  has_many :packages, :foreign_key => :event_id, :dependent => :destroy
  has_many :children, :through => :collections, :source => :group, :dependent => :destroy
end
