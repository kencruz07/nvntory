class Inventory < ActiveRecord::Base

  scope :list_by_id, -> { order :id => :asc }

end
