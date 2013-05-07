class Volume < ActiveRecord::Base
  attr_accessible :own, :series_id, :volume_number
  belongs_to :series
  
  validates(:volume_number, presence: true)
  validates(:series_id, presence: true)
end
