object @series
attributes :id, :title, :published_at

child :issues do
  attributes :id, :issue_number
end