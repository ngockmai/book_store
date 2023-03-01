class BooksController < ApplicationController
  def index
    @books = Book.all.order("created_at desc").page(params[:page]).per(16)
  end
  def show
    @book = Book.find(params[:id])
    @language = @book.language
    @publisher = @book.publisher
    @genre = @book.genre
    @authors = @book.authors
  end
  def search
    wildcard_search = "%#{params[:keywords]}%" if params[:keywords].present?

    @books = Book.where('title LIKE ? or isbn13 LIKE ?', wildcard_search, wildcard_search)
    @books = @books.where(genre_id: params[:genre_id]) if params[:genre_id].present?
    @books = @books.page(params[:page]).per(5)
  end
end