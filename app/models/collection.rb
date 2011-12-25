class Collection < ActiveRecord::Base
  validates :group_id, :unit_id,  :presence => true
  attr_accessible :group_id, :unit_id
  belongs_to :units
  belongs_to :groups
end
