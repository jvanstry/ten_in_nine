class Project < ActiveRecord::Base
  validates :name, :github_url, :thumbnail_url, :presence => true
  acts_as_taggable
end
