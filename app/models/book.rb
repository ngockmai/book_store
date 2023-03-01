class Book < ApplicationRecord
  belongs_to :language
  belongs_to :publisher
  belongs_to :genre

  has_many :book_authors, dependent: :destroy
  has_many :authors, through: :book_authors

  validates :title, :isbn13, :publication_date, :language_id, :publisher_id, :genre_id, presence: true

end