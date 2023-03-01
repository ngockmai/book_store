class Search < ApplicationRecord
  def search_books
    books = Book.all

    books = books.where('title LIKE ? or isbn13 LIKE ?', "%#{keywords}%") if keywords.present?
    return books
  end
end
