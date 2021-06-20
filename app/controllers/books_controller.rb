class BooksController < ApplicationController
    
    before_action :set_book, only: [:show, :edit, :destroy, :update]

    def index
        @books = Book.all
    end

    def show
    end

    def edit
    end

    def update
        if @book.update(book_params)
            authors = params[:book][:authors]
            authors = authors.reject { |author| author.empty? }
            @book.authors = []
            authors.each do |author|
            @book.authors << Author.find_by(first_name: author) unless @book.authors.include?(Author.find_by(first_name: author))
          end
            redirect_to @book
        else
            render 'edit'
        end
    end

    def new
        @book = Book.new
    end

    def create
        @book = Book.new(book_params)
        if @book.save
          authors = params[:book][:authors]
          authors = authors.reject { |author| author.empty? }
          authors.each do |author|
            @book.authors << Author.find_by(first_name: author)
          end
          redirect_to @book
        else
          render :new
        end
    end

    def destroy
        @book.destroy
        redirect_to books_path
    end

    private

    def set_book
        @book = Book.find(params[:id])
    end

    def book_params
        params.require(:book).permit(:book_id, :book_title, :authors)
    end


end