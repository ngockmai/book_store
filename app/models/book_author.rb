class BookAuthor < ApplicationRecord
  belongs_to :book
  belongs_to :author

  validates :author_id, :book_id, presence: true
end
