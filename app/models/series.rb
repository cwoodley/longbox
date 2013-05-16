class Series < ActiveRecord::Base
  attr_accessible :pull, :title, :slug
  has_many :issues
  has_many :volumes
  
  validates :title, presence: true, uniqueness: true        
  
  before_save { |series| series.title = title.capitalize }

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
  
  extend FriendlyId
  friendly_id :title, use: :slugged
end
