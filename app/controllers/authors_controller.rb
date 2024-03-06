class AuthorsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        @authors= Author.all
    end
    
    def show
        @author = Author.find(params[:id])
        @books = @author.books
      
    end

    def new
        @author = Author.new
    end

    def create
        @author = Author.new(author_params)
        if @author.save
            redirect_to @author
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit 
        @author = Author.find_by(id: params[:id])
    end

    def update
        @author = Author.find_by(id: params[:id])
    
        if @author.update(author_params)
          redirect_to @author
        else
          render :edit, status: :unprocessable_entity
        end
      end
    
      def destroy
        @author = Author.first
        @author.destroy
    
    
        redirect_to root_path
      end

      def bulk_delete
        @authors = Author.where(id: params[:author_ids])
        @authors.destroy_all
        respond_to do |format|
          format.js
        end
      end

      def show_video
        @author = Author.find(params[:id])  
        @video_attachment = @author.video_attachment 
      end
      def show_pdf
        @author = Author.find(params[:id])  
        @pdf_attachment = @author.pdf_attachment  
      end
      private
        def author_params
          params.require(:author).permit(:aname, :image)
        end
    
end
