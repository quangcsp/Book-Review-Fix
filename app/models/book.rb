class Book < ApplicationRecord
  belongs_to :user
  has_many :book_categories
  has_many :categories, :through => :book_categories, :dependent => :destroy
  has_many :reviews

  has_attached_file :book_img, styles: { book_index: "250x250>", book_show: "325x475>" }, default_url: ':placeholder'
  validates_attachment_content_type :book_img, content_type: /\Aimage\/.*\z/
  validates :title, presence: true
  validates :author, presence: true
  validates :categories, presence: true
  
  def self.search(search)
    where("title LIKE ?", "%#{search}%") 
    where("author LIKE ?", "%#{search}%")
    where("description LIKE ?", "%#{search}%")
  end
end
