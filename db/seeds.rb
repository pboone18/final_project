# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# ADD FIND OR INITIALIZE INSTEAD OF CREATE check: http://stackoverflow.com/questions/3046607/rails-find-or-create-by-more-than-one-attribute
puts 'Adding seed books'
Review.create booktitle: "The Supremes at Earl\'s All-You-Can-Eat",
			 author: "Edward Kelsey Moore",
             bookthumb: 'https://d.gr-assets.com/books/1359040518s/15742642.jpg',
             rating: 3.93

Review.create booktitle: "Living and Dying in Brick City",
			 author: "Sampson Davis",
             bookthumb: 'https://d.gr-assets.com/books/1351213400s/13643005.jpg',
             rating: 3.76

Review.create booktitle: 'The Secret of Magic',
			 author: "Deborah Johnson",
             bookthumb: 'https://d.gr-assets.com/books/1372044679s/18079775.jpg',
             rating: 3.88

puts 'Done adding books'

#Add Chapters and States
puts 'Adding Chapter seeds'
Chapter.create chaptername: "AL1", state: "Alabama"
puts 'Done adding chapters'