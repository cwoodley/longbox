class Issue < ActiveRecord::Base
  attr_accessible :issue_number, :own, :series_id, :cover, :cover_remote_url
  belongs_to :series
  
  validates(:issue_number, presence: true)
  validates(:series_id, presence: true)

  attr_reader :cover_remote_url
  has_attached_file :cover, styles: {
    thumb: '100x100>',
    medium: '300x300>',
    large: '600x600>'
  } 

  def cover_remote_url=(url_value)
    self.cover = URI.parse(url_value)
    # Assuming url_value is http://example.com/photos/face.png
    # avatar_file_name == "face.png"
    # avatar_content_type == "image/png"
    @cover_remote_url = url_value
  end


end
