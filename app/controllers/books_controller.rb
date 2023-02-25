class BooksController < ApplicationController
  def index
    @books = Book.all
  end
  def show
    @book = Book.find(params[:id])
    @language = @book.language
    @publisher = @book.publisher
    @genre = @book.genre
  end
end
