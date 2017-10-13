class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :books
  has_many :reviews, :dependent => :delete_all

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar, styles: { medium: "300x300#", thumb: "100x100#" }, default_url: ':placeholder'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def admin?
  	admin
  end  
end
