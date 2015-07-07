class Video < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings

  def tag=(name)
    self.tags = [Tag.where(name: name).first_or_create!]
  end

  def tag
    self.tags.map(&:name).join('')
  end

  scope :published, -> { where(processed: true) }
  scope :unpublished, -> { where(processed: false) }
end
