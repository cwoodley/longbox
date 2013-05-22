class Issue < ActiveRecord::Base
  attr_accessible :issue_number, :own, :series_id, :cover, :remote_cover_url
  belongs_to :series
  
  validates(:issue_number, presence: true)
  validates(:series_id, presence: true)

  mount_uploader :cover, CoverUploader

  scope :owned, :conditions => {:own => true}
  scope :wanted, :conditions => {:own => false}

end
