class Series < ActiveRecord::Base
  attr_accessible :pull, :title
  has_many :issues
  has_many :volumes
  
  validates :title, presence: true, uniqueness: true
  validates :slug, uniqueness: true, presence: true,
                 exclusion: {in: %w[signup login]}
  before_validation :generate_slug               
  
  before_save { |series| series.title = title.capitalize }

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
  
  def to_param
    slug # or "#{id}-#{name}".parameterize
  end

  def generate_slug
    self.slug ||= name.parameterize
  end
end
