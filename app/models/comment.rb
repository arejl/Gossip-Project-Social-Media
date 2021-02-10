class Comment < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  belongs_to :gossip, optional: true
  has_many :likes
  belongs_to :commentable, polymorphic: true, optional: true
  has_many :comments, as: :commentable
end
