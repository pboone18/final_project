class CommentsController < ApplicationController
require 'httparty'
before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
  	#CHECK
  	# @comments = Comment.search_for(params[:q])
  end

  def new
    @comment = Comment.new
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
    movie = RottenMovie.find(title: @movie.title, limit: 1)
    @rotten_score = movie.ratings.critics_score
    @rotten_poster = movie.posters.original
  end

  private

    def load_comment
      @comment = Comment.find params[:id]
    end

    def safe_comment_params
    	#CHECK
      params.require(:comment).permit(:title, :description, :year_released, :rating)
    end

end
