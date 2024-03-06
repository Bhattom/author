class BooksController < ApplicationController
    def index
        @books= Book.all

    end
    
    def show
        @book = Book.find(params[:id])
        @lineitem = Lineitem.find(params[:id])
       
    end

    def new
      @author = Author.find_by(id: params[:id])
      @book = Book.new
      
    end

    def create
      @author = Author.find(params[:id])
      @book = @author.books.build(book_params)
      if @book.save
            redirect_to @book
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit 
        @book = Book.find_by(id: params[:id])
    end

    def update
        @book = Book.find_by(id: params[:id])
    
        if @book.update(book_params)
          redirect_to @book
        else
          render :edit, status: :unprocessable_entity
        end
    end
    
      def destroy
        @book = Book.find( params[:id])
        @book.destroy
        redirect_to root_path
      end
    
      private
        def book_params
          params.require(:book).permit(:bname, :author_id)
        end

end
 
