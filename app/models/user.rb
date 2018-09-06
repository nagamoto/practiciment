class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles
  has_many :comments

  default_scope { where.not(archived_at: nil) }
  # User.all
  # User Load (4.2ms)  SELECT  "users".* FROM "users" WHERE "users"."archived_at" IS NOT NULL LIMIT ?  [["LIMIT", 11]]

  scope :filter_by_birthday, ->(date) { where(birthday: date) if date.present? }
  scope :born_on, ->(date) { where(birthday: date) }


  #scope :born_after, ->(date) { where('birthday >= ?', date) }
  #User.born_in(Date.today)
  #User Load (0.3ms)  SELECT  "users".* FROM "users" WHERE (birthday >= '2018-09-06') LIMIT ?  [["LIMIT", 11]]
  #=> #<ActiveRecord::Relation []>

  # User.born_in('s').size
  # (0.2ms)  SELECT COUNT(*) FROM "users" WHERE (birthday >= 's')
  # => 0

  #User.born_in('0').size
  # (0.3ms)  SELECT COUNT(*) FROM "users" WHERE (birthday >= '0')
  #=> 11

  scope :born_after, ->(date) { where(birthday: date..Date.today) }
  #User.born_after(Date.today - 10.years).size
  # (0.2ms)  SELECT COUNT(*) FROM "users" WHERE "users"."birthday" BETWEEN ? AND ?  [["birthday", "2008-09-06"], ["birthday", "2018-09-06"]]
  # => 2


end
