class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user
  acts_as_commentable
  acts_as_votable
  has_many :comments

  scope :most_recent, ->{order created_at: :desc}
  scope :priority, -> user do
    where "user_id IN (?) OR user_id = ?", user.get_voted(User).select(:id), user.id
  end
end
