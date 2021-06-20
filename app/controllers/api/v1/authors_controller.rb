module Api
    module V1
      class AuthorsController < ApplicationController
        rescue_from ActiveRecord::RecordInvalid, with: :show_errors
        rescue_from ActiveRecord::RecordNotFound, with: :show_errors
        skip_before_action :verify_authenticity_token
        before_action :set_author, only: %i[ show edit update destroy ]
        
        def index
            render json: Author.all
        end

        def show
            book_ids = AuthorBook.where(author_id: params[:id]).pluck('book_id')
            books = Book.where(book_id: book_ids).pluck('book_title')
            render json:{"author_details": Author.find(params[:id]),
                 "books": books}
        end

        def destroy
            @author.destroy
            head :no_content
        end

        def set_author
            @author = Author.find(params[:id])
        end
    
        def author_params
            params.require(:author).permit(:author_id, :first_name, :last_name, :date_of_birth)
        end
      end
    end
  end