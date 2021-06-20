class AuthorsController < ApplicationController
    before_action :set_author, only: %i[ show edit update destroy ]
  
    # GET /authors or /authors.json
    def index
      @authors = Author.all
    end
  
    # GET /authors/1 or /authors/1.json
    def show
    end
  
    # GET /authors/new
    def new
      @author = Author.new
      # @books= Book.all.pluck(:book_title)
    end
  
    # GET /authors/1/edit
    def edit
    end
  
    # POST /authors or /authors.json
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
  
    # PATCH/PUT /authors/1 or /authors/1.json
    def update
        if @author.update(author_params)
          redirect_to @author
        else
          render :edit
        end
    end
  
    # DELETE /authors/1 or /authors/1.json
    def destroy
      @author.destroy
      redirect_to authors_path

    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_author
        @author = Author.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def author_params
        params.require(:author).permit(:author_id, :first_name, :last_name, :date_of_birth)
      end
  end
  