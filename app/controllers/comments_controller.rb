class CommentsController < ApplicationController

respond_to :json
# before_action :load_review, only: [:show, :edit, :update, :destroy]
before_action :load_comment, only: [:show, :edit, :update, :destroy]

  def index 
  	@comments = Comment.all
  	@reviews = Review.all
  	# get_from_goodreads
  	@books = Review.show_from_goodreads
  end

  def new
    @comment = Comment.new
  end

  def create
    @title = params["comment"]["booktitle"]
    
    @comment = Comment.new safe_comment_params
    
    comment_params = params[:comment]
    
    # @comment.user = current_user

    @books = Review.where(booktitle: @title)

    if @books.present?
      @book = @books.first
    else
      @book = Review.create(
        booktitle: comment_params[:booktitle],
        bookthumb: comment_params[:bookthumb],
        author: comment_params[:author],
        rating: comment_params[:rating]
      )  
    end



    if @comment.save
      @comment.update_attributes!(review: @book)

      redirect_to @comment
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @comment.update(safe_comment_params) 
      # && @book.update(safe_review_params)
      redirect_to @comment
    else
      render 'edit'
    end
  end

  def show
  end

   def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def load_comment
    @comment = Comment.find params[:id]
  end

  def safe_comment_params
  	#CHECK
    params.require(:comment).permit(:cmonth, :cyear, :cchapter, :cmembernum, :cgograting, :creview, :cquestions, :crecommend, :review_id, :user_id)
  end

  def safe_review_params
    params.require(:review).permit(:booktitle, :author, :rating, :bookthumb)
  end

end
