class Series < ActiveRecord::Base
  attr_accessible :pull, :title
  has_many :issues
  has_many :volumes
  
  validates :title, presence: true, uniqueness: true
  
  before_save { |series| series.title = title.capitalize }
end
