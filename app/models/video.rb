class Video < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings

  def all_tags=(name)
    self.tags = [Tag.where(name: name).first_or_create!]
  end

  def all_tags
    self.tags.map(&:name).join('')
  end
end
