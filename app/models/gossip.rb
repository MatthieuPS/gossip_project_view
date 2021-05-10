class Gossip < ApplicationRecord
  belongs_to :user
  has_many :jointablegossiptags
  has_many :tags, through: :jointablegossiptags
end
