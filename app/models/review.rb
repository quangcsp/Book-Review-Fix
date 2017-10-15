class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user, dependent: :destroy
  acts_as_commentable
  acts_as_votable
  has_many :comments
end
