class AuthorsController < ApplicationController
    before_action :set_author, only: %i[ show edit update destroy ]

    def index
      @authors = Author.all
    end
  
    def show
    end
  
    def new
      @author = Author.new
      # @books= Book.all.pluck(:book_title)
    end
  
    def edit
    end
  
    def create
      @author = Author.new(author_params)
      unless author_params[:date_of_birth].empty?
        @author.date_of_birth = DateTime.parse(author_params[:date_of_birth])
      end

        if @author.save
          redirect_to @author
        else
          render :new
        end
    end

    def update
        if @author.update(author_params)
          redirect_to @author
        else
          render :edit
        end
    end
  
    def destroy
      @author.destroy
      redirect_to authors_path

    end
  
    private

      def set_author
        @author = Author.find(params[:id])
      end
  
      def author_params
        params.require(:author).permit(:author_id, :first_name, :last_name, :date_of_birth)
      end
  end
  