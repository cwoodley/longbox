class Issue < ActiveRecord::Base
  attr_accessible :issue_number, :own, :series_id
  belongs_to :series
  
  validates(:issue_number, presence: true)
  validates(:series_id, presence: true)
end
