# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'
require 'faker'
require_relative '../app/models/ar.rb'





Author.destroy_all
Publisher.destroy_all
Genre.destroy_all
Language.destroy_all
Book.destroy_all
BookAuthor.destroy_all

# Reset id field in tables in sqlite db
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'publishers'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'authors'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'genres'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'languages'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'books'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'books_authors'")


filename = Rails.root.join("db/book_store_dataset.csv")

# puts "Loading data from the csv file: #{filename}"

csv_data = File.read(filename)
books = CSV.parse(csv_data, headers:true, encoding: "utf-8")

puts "#{books.size}"

books.each do |b|
  publisher = Publisher.find_or_create_by(name: b['book_publisher'])
  genre = Genre.find_or_create_by(name: b['book_genre'])
  language = Language.find_or_create_by(name: b['book_language'])
  author = Author.find_or_create_by(name: b['book_author_name'])

  book = Book.create(
    title:            b['book_name'],
    description:      b['book_description'],
    isbn13:           Faker::ISBN.thirteen_digit,
    num_pages:        b['book_page_num'],
    publication_date: Faker::Date.between(from: '2014-09-23', to: Date.today),
    price:            b['book_price'],
    image_url:        b['book_image_url'],
    language_id:      language.id,
    publisher_id:     publisher.id,
    genre_id:         genre.id
  )

  book_author = BookAuthor.create(
    book_id:          book.id,
    author_id:        author.id
  )
    # puts "#{book.errors.full_messages.join(', ')}"
end

# first step 1: fill up genres, author tables, language, publisher
# first step 2: search names from the books and grab id from there.
# first step 3: fill up book_author when having book_id and author_id?