class Comment < ApplicationRecord
  belongs_to :book
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  validates :user_id, presence: true
end
