class Package < ActiveRecord::Base
  validates :event_id, :group_id,  :presence => true
  attr_accessible :event_id, :group_id
  belongs_to :event
  belongs_to :group
end
