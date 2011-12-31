class Item < ActiveRecord::Base
  has_many :units, :dependent => :destroy

  def count_in
    u = self.units.where('item_id = ? and is_in = ?', self.id, true)
    return u.count
  end
end
