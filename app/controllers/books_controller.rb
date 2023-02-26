class BooksController < ApplicationController
  def index
    @books = Book.all.order("created_at desc").page(params[:page]).per(10)
  end
  def show
    @book = Book.find(params[:id])
    @language = @book.language
    @publisher = @book.publisher
    @genre = @book.genre
    @authors = @book.authors
  end
  def search
    wildcard_search = "%#{params[:keywords]}%"
    @books = Book.where('title LIKE ?', wildcard_search)
  end
end