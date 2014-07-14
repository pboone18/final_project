class Review < ActiveRecord::Base
	#BOOK INFO FROM GOODREADS GOES HERE
	has_many :comments, foreign_key: :comment_id

    def self.show_from_goodreads
		@isbns = ["0307959929", "1400069947", "0399157727", "1594486344", "0820338885", "1780874960", "0778315339"]
		book_url = "http://www.goodreads.com"
		method = "/book/isbn?isbn="
		apikey = "qV5HzqB50GO5PqwPOXew"
    	@books = []
    	@isbns.each do |isbn|
  			HTTParty.get(book_url+method+isbn+"&key="+apikey)
  			result =  HTTParty.get(book_url+method+isbn+"&key="+apikey)
  			title = result["GoodreadsResponse"]["book"]["title"]
  			author = result["GoodreadsResponse"]["book"]["authors"]["author"]["name"]
  			image = result["GoodreadsResponse"]["book"]["small_image_url"]
  			rating = result["GoodreadsResponse"]["book"]["average_rating"]
  			@bookinfo = {booktitle: title, author: author, bookthumb: image, rating: rating}
  			@books << @bookinfo
  		end  
  		@books
    end
end
