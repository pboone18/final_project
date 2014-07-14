class CommentsController < ApplicationController

respond_to :json
before_action :load_comment, only: [:show, :edit, :update, :destroy]

  def index
  	#CHECK
  	@comments = Comment.all
  	@reviews = Review.all
  	# get_from_goodreads
  	@books = Review.show_from_goodreads
  end

  def new
    @comment = Comment.new

    @book = Review.new(
      booktitle: params[:booktitle],
      bookthumb: params[:bookthumb],
      author: params[:author],
      rating: params[:rating]
    )
  end

  def create
    @comment = Comment.new safe_comment_params
    # @book = Review.new safe_review_params

    if @comment.save 
      # && @book.save
      redirect_to @comment
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @comment.update(safe_comment_params)
      redirect_to @comment
    else
      render 'edit'
    end
  end

  def show
  	#CHECK
    # movie = RottenMovie.find(title: @movie.title, limit: 1)
    # @rotten_score = movie.ratings.critics_score
    # @rotten_poster = movie.posters.original
    # @comment = Comment.find params[:id]
    # @review = @comment.reviews
    #   @book = Review.new(
    #   booktitle: params[:booktitle],
    #   bookthumb: params[:bookthumb],
    #   author: params[:author],
    #   rating: params[:rating]
    # )
    book = Review.find(booktitle: @book.booktitle, limit: 1)
  end

  private

  def load_comment
    @comment = Comment.find params[:id]
  end

  def load_review
    @book = Review.find params[:id]
  end


  def safe_comment_params
  	#CHECK
    params.require(:comment).permit(:cmonth, :cyear, :cchapter, :cmembernum, :cgograting, :creview, :cquestions, :crecommend)
  end

  def safe_review_params
    params.require(:review).permit(:booktitle, :author, :rating, :bookthumb)
  end

end
