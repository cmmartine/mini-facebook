# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!(username: 'Alfred', email: 'alfred@email.com', password: 'alfred1', password_confirmation: 'alfred1')

User.create!(username: 'Becca', email: 'becca@email.com', password: 'becca1', password_confirmation: 'becca1')

Post.create!(body: 'This is the first testing post for this app!', user_id: 1)

Comment.create!(body: 'This post is the best ever', user_id: 2, post_id: 1)

Like.create!(user_id: 2, post_id: 1)

Request.create!(receiving_user_id: 2, sending_user_id: 1)

Friendship.create!(user_id: 1, friend_id: 2)
Friendship.create!(user_id: 2, friend_id: 1)

p 'Some database items created'
