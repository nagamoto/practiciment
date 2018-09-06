# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(email: 'user1@example.com',   password: 'password', name: 'one', birthday: '1970-01-01')
user2 = User.create(email: 'user2@example.com',   password: 'password', name: 'two', birthday: '1974-02-01')
user3 = User.create(email: 'user3@example.com',   password: 'password', name: 'three', birthday: '1978-03-01')
user4 = User.create(email: 'user4@example.com',   password: 'password', name: 'four', birthday: '1982-04-01')
User.create(email: 'user5@example.com',   password: 'password', name: 'five', birthday: '1986-05-01')
User.create(email: 'user6@example.com',   password: 'password', name: 'six', birthday: '1990-06-01')
User.create(email: 'user7@example.com',   password: 'password', name: 'seven', birthday: '1994-07-01')
User.create(email: 'user8@example.com',   password: 'password', name: 'eight', birthday: '1998-08-01')
User.create(email: 'user9example.com',   password: 'password', name: 'nine', birthday: '2002-09-01')
User.create(email: 'user10@example.com',   password: 'password', name: 'ten', birthday: '2006-10-01')
User.create(email: 'user11@example.com',   password: 'password', name: 'eleven', birthday: '2010-11-01')
User.create(email: 'user12@example.com',   password: 'password', name: 'twelve', birthday: '2014-12-01')


art1 = user1.articles.create(title: 'title 1', body: 'body 1')
art2 = user1.articles.create(title: 'title 2', body: 'body 2')
user1.articles.create(title: 'title 3', body: 'body 3')
user1.articles.create(title: 'title 4', body: 'body 4')

art3 = user2.articles.create(title: 'title 1', body: 'body 1')
user2.articles.create(title: 'title 2', body: 'body 2')
user2.articles.create(title: 'title 3', body: 'body 3')

user3.comments.create(body: 'comment1 body', article: art1)
user3.comments.create(body: 'comment2 body', article: art1)
user3.comments.create(body: 'comment3 body', article: art1)
user3.comments.create(body: 'comment4 body', article: art1)
user3.comments.create(body: 'comment5 body', article: art3)

user1.comments.create(body: 'comment6 body', article: art2)
