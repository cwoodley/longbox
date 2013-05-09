class Issue < ActiveRecord::Base
  attr_accessible :issue_number, :own, :series_id
  belongs_to :series
  
  validates(:issue_number, presence: true)
  validates(:series_id, presence: true)
  
  has_attached_file :cover, styles: {
    thumb: '170x170>',
    square: '100x100#',
    medium: '300x300>'
  } 
end
