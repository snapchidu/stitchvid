class Video < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings

  validates_presence_of :title
end
