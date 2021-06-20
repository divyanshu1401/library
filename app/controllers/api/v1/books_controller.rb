module Api
    module V1
      class BooksController < ApplicationController
        rescue_from ActiveRecord::RecordInvalid, with: :show_errors
        rescue_from ActiveRecord::RecordNotFound, with: :show_errors
        skip_before_action :verify_authenticity_token
        before_action :set_book, only: [:show, :edit, :destroy, :update]
        def index
            render json: Book.all
        end

        def create
          byebug
          @book = Book.create!(book_params)
          render json: {
            book: @book
          }
        end

        
        def update
          @book.update(book_params)
          head :no_content
        end

        def show
          author_ids = AuthorBook.where(book_id: params[:id]).pluck('author_id')
          authors = Author.where(author_id: author_ids).pluck('first_name')
          render json:{"book_details": Book.find(params[:id]),
               "authors": authors}
        end

        def destroy
          @book.destroy
          head :no_content
        end

        private

        def set_book
            @book = Book.find(params[:id])
        end

        def book_params
            params.permit(:book_id, :book_title)
        end
      end
    end
  end