class Review < ActiveRecord::Base
	#BOOK INFO FROM GOODREADS GOES HERE
	has_many :comments
end
