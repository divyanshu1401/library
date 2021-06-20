class Book < ApplicationRecord
    self.primary_key = "book_id"

    has_many :author_books, dependent: :delete_all
    has_many :authors, through: :author_books

    validates :book_id, presence: true, uniqueness: true
    validates :book_title, presence: true, uniqueness: true
end