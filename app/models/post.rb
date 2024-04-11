class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :title, :content, :url, presence: true
end
