class Comment < ActiveRecord::Base
	belongs_to :review
	
	# validates :cmonth, :inclusion => %w( January February March April May June July August September October November December )
	# validates :cyear, :presence => {:message => 'Please choose a year for your review.'}
	# validates :cchapter, :presence => {:message => 'Please include your ChapterID.'}
	# validates :cgograting, :presence => {:message => 'Please enter a rating for your chapter (1-5).'}
	# validates :creview, :presence => {:message => 'Please enter a review for your chapter.'}
end
