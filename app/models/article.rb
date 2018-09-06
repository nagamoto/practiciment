class Article < ApplicationRecord
  belongs_to :user
  has_many :comments

  scope :filter_by_text, ->(text) { where('articles.title like :text or articles.body like :text', text: "%#{text}%") if text.present? }
  # Article.filter_by_text('body')
  # SELECT  "articles".* FROM "articles" WHERE (articles.title like '%body%' or articles.body like '%body%') LIMIT ?  [["LIMIT", 11]]
  scope :body_contained, ->(text) { where('articles.title like :text or articles.body like :text', text: "%#{text}%") }
  scope :title_contained, ->(text) { where('articles.title like :text or articles.body like :text', text: "%#{text}%") }

  scope :filter_by_created_at, lambda { |from, till|
    if from.present? && till.present?
      where(created_at: from..till)
    elsif from.present?
      where('date >= ?', from)
    elsif till.present?
      where('date <= ?', till)
    end
  }
  # Article.filter_by_created_at(Time.current - 1.day, Time.current)
  # SELECT  "articles".* FROM "articles" WHERE "articles"."created_at" BETWEEN ? AND ? LIMIT ?  [["created_at", "2018-09-05 09:25:00.938072"], ["created_at", "2018-09-06 09:25:00.938784"], ["LIMIT", 11]]

  # scope :created_after, ->(time) { where('created_at >= ?', time) }

  scope :created_after, ->(time) { where(created_at: time..Time.current) }



  # scope :filter_by, ->(company_id:, query:, from:, to:) { filter_by_company(company_id).filter_by_query(query).filter_by_date(from, to) }
end
