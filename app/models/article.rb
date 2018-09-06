class Article < ApplicationRecord
  belongs_to :user
  has_many :comments

  scope :filter_by_text, ->(text) { where('articles.title like :text or articles.body like :text', query: "%#{query}%") if text.present? }
end
