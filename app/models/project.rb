class Project < ActiveRecord::Base
  validates :name, :presence => true
  validates :github_url, :presence => true
  validates :description, :presence => true

  acts_as_taggable
end
