class Author < ApplicationRecord
    self.primary_key = "author_id"
    has_many :author_books, dependent: :delete_all
    has_many :books, through: :author_books

    validates :author_id, presence: true, uniqueness: true
    validates :first_name, presence: true
end