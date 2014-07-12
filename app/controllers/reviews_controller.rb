class ReviewsController < ApplicationController
  # require 'pry-rails'
  require 'httparty'
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    # binding.pry
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:booktitle, :author, :bookthumb, :url, :rating, :month, :year, :chapter, :membernum, :gograting, :review, :questions, :recommend)
    end
# DOES THIS METHOD NEED TO BE IN PRIVATE???
    def show_from_goodreads(ibsns)
      isbns.map do |isbn|
        result = HTTParty.get(url+method+isbn+"&key="+apikey)
        books["all"] = result["GoodreadsResponse"]["book"]["title"], result["GoodreadsResponse"]["book"]["authors"]["author"]["name"], result["GoodreadsResponse"]["book"]["small_image_url"], result["GoodreadsResponse"]["book"]["average_rating"]
      end
    end

    def get_from_goodreads
      books = Books.new
      isbns = ["0307959929", "1400069947", "0399157727", "1594486344", "0820338885", "178087496"]
      url = "http://www.goodreads.com"
      method = "/book/isbn?isbn="
      key = "qV5HzqB50GO5PqwPOXew"
    end


end


