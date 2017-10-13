class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user, dependent: :destroy
  acts_as_commentable
  has_many :comments
end
