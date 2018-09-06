class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles
  has_many :comments

  scope :filter_by_birthday, ->(date) { where(birthday: date) if date.present? }

  scope :filter_by_date, lambda { |from, to|
    if from.present? && to.present?
      where(date: from..to)
    elsif from.present?
      where('date >= ?', from)
    elsif to.present?
      where('date <= ?', to)
    end
  }
  scope :filter_by, ->(company_id:, query:, from:, to:) { filter_by_company(company_id).filter_by_query(query).filter_by_date(from, to) }

end
