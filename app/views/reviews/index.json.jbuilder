json.array!(@reviews) do |review|
  json.extract! review, :id, :booktitle, :author, :bookthumb, :url, :rating, :month, :year, :chapter, :membernum, :gograting, :review, :questions, :recommend
  json.url review_url(review, format: :json)
end
