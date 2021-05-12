class BooksController < ApplicationController
    include Pundit
    before_action :authenticate_user!

    
    before_action :set_models, only: [:update, :show, :destroy, :edit]
    before_action :check_auth, except: [:index, :show]

    def index
        @books = Book.order(:author_id)
    end

    def show
    end

    def new
        @book = Book.new
        @authors = Author.order(:last_name)
        @genres = Genre.order(:name)
    end

    def create
        
        @authors = Author.order(:last_name)
        @book = Book.new(book_params)
        if @book.save
            redirect_to @book
        else
            flash.now[:errors] = @book.errors.full_messages
            render action: 'new'
        end
    end

    def edit
    end

    def update
        if @book.update(book_params)
            redirect_to @book
        else
            flash.now[:errors] = @book.errors.full_messages
            render action: 'edit'
        end
    end

    def destroy
        @book.destroy
        redirect_to books_path
    end

    private

    def set_models
        @book = Book.find(params[:id])
        @authors = Author.order(:last_name)
        @genres = Genre.order(:name)
    end

    def check_auth
        authorize Book
    end

    def book_params
        params.require(:book).permit(:title, :author_id, :cover_image, genre_ids: [])
    end
end
