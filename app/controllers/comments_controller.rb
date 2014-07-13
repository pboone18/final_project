# require 'httparty'
class CommentsController < ApplicationController

# before_filter :restrict_access
# before_filter :get_from_goodreads
respond_to :json
before_action :load_comment, only: [:show, :edit, :update, :destroy]

  def index
  	#CHECK
  	@comments = Comment.all
  	@reviews = Review.all
  	# get_from_goodreads
  	show_from_goodreads
  	# @comment = Comment.find params[:id]
  end

  def new
    @comment = Comment.new
    # @book = Book.new safe_book_params
  end

  def create
    @comment = Comment.new safe_comment_params


    if @comment.save
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
  end

  private

  	# def restrict_access
  	# 	authenticate_or_request_with_http_token do |token, options|
  	# 		ApiKey.exists?(access_token :token)
  	# 	end
# DOES THIS METHOD NEED TO BE IN PRIVATE???
    def show_from_goodreads
      @isbns = ["0307959929", "1400069947", "0399157727", "1594486344", "0820338885", "1780874960", "0778315339"]
      url = "http://www.goodreads.com"
      method = "/book/isbn?isbn="
      apikey = "qV5HzqB50GO5PqwPOXew"
    	@books = []
    	# @bookinfo = {}
    	
 		@isbns.each do |isbn|
			HTTParty.get(url+method+isbn+"&key="+apikey)
			result =  HTTParty.get(url+method+isbn+"&key="+apikey)
			title = result["GoodreadsResponse"]["book"]["title"]
			author = result["GoodreadsResponse"]["book"]["authors"]["author"]["name"]
			image = result["GoodreadsResponse"]["book"]["small_image_url"]
			rating = result["GoodreadsResponse"]["book"]["average_rating"]
			@bookinfo = {title: title, author: author, image: image, rating: rating}
			# p @books
			# p @bookinfo 
			# p "!!!!!!!!!"
			@books << @bookinfo
		end  


        # @reviews = @result["GoodreadsResponse"]["book"]["title"], result["GoodreadsResponse"]["book"]["authors"]["author"]["name"], result["GoodreadsResponse"]["book"]["small_image_url"], result["GoodreadsResponse"]["book"]["average_rating"]
      
    end

    # def get_from_goodreads
    #   @reviews = Review.new
    # end


    def load_comment
      @comment = Comment.find params[:id]
    end

    def safe_comment_params
    	#CHECK
      params.require(:comment).permit(:cmonth, :cyear, :cchapter, :cmembernum, :cgograting, :creview, :cquestions, :crecommend)
    end

    def safe_book_params
      params.require(:book).permit(:title, :author, :rating)
    end

end
