class Repository < ApplicationRecord
  validates_presence_of :github_id, :name, :url
  validates_uniqueness_of :github_id
end
