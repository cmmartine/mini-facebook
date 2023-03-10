# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!(username: 'Alfred', email: 'alfred@email.com', password: 'alfred1', password_confirmation: 'alfred1', confirmed_at: '2011-12-01 11:30:45 UTC', confirmation_sent_at: '2011-12-01 11:30:46 UTC', profile_information: "Master Wayne is definitely not Batman.")

User.create!(username: 'Becca', email: 'becca@email.com', password: 'becca1', password_confirmation: 'becca1', confirmed_at: '1999-12-29 13:01:23 UTC', confirmation_sent_at: '1999-12-29 13:01:24 UTC', profile_information: "Just a Becca girl living in a not Becca world.")

User.create!(username: 'Curtis Moonshine', email: 'curtis@email.com', password: 'curtis1', password_confirmation: 'curtis1', confirmed_at: '2004-2-5 13:01:23 UTC', confirmation_sent_at: '2004-2-4 11:11:11 UTC')

User.create!(username: 'Daniel Rudcliffe', email: 'daniel@email.com', password: 'daniel1', password_confirmation: 'daniel1', confirmed_at: '2008-7-29 13:01:23 UTC', confirmation_sent_at: '2008-6-10 12:12:12 UTC')

Post.create!(body: 'This is the first testing post for this app!', user_id: 1, created_at: '2023-02-03 18:23:31 UTC')
Post.create!(body: 'Y2k is a lie!', user_id: 2, created_at: '2000-01-01 00:00:00 UTC')
Post.create!(body: 'Another post ', user_id: 2, created_at: '2043-06-13 11:12:13 UTC')
Post.create!(body: "It's almost christmas!", user_id: 1, created_at: '2011-12-01 21:30:00 UTC')

Comment.create!(body: 'This post is the best ever', user_id: 2, post_id: 1)

Like.create!(user_id: 2, post_id: 1)

#Request.create!(receiving_user_id: 2, sending_user_id: 1)

# Friendship.create!(user_id: 1, friend_id: 2)
# Friendship.create!(user_id: 2, friend_id: 1)

p 'Some database items created'
