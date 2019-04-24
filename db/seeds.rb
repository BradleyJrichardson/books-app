puts 'Creating an admin user'
admin = User.create({ :email => 'admin@admin.com.au', :password => 'password321', :password_confirmation => 'password321', :admin => true, moderator: false})
puts admin.email

puts 'Creating a regular user'
regular = User.create({ :email => 'test@test.com.au', :password => '123456', :password_confirmation => '123456', :admin => false, moderator: false})
puts regular.email

puts 'Creating a user with moderator privilege'
moderator = User.create({ :email => 'moderator@moderator.com.au', :password => '123456', :password_confirmation => '123456', :admin => false, moderator: true})
puts regular.moderator

puts 'Creating books, authors and reviews'

10.times do 
  author_name = Faker::Book.author
  author = Author.create({name: author_name})
  5.times do
    title = Faker::Book.title
    description = Faker::Book.genre
    rating = rand(1..5)
    # author_id = author.id
    book = Book.new({title: title, description: description, rating: rating})
    book.author_id = author.id
    book.save

    3.times do
      book.reviews.create({title: Faker::Artist.name, review: Faker::Restaurant.review})
    end
  end
end

puts "Seeding Over"