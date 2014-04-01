class Project < ActiveRecord::Base
  validates :name, :presence => true
  validates :github_url, :presence => true
  validates :thumbnail_url, :presence => true

  acts_as_taggable
end
