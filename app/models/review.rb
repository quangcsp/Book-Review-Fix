class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user
  acts_as_commentable
  has_many :comments
end
