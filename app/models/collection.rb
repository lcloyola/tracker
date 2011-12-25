class Collection < ActiveRecord::Base
  validates :group_id, :unit_id,  :presence => true
  attr_accessible :group_id, :unit_id
  belongs_to :unit
  belongs_to :group
end
