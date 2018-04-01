require './detectBookGenre/book'
require 'json'
require 'csv'

# parse the json file to get books' data
file = File.read(ARGV[0])
books = JSON.parse file

# get genre names, keywords and corresponding points
genreData = CSV.read(ARGV[1])

# get rid of first line which is title
genreData.shift

# get unique genre names
genres = genreData.transpose[0].uniq

books.each {|the| # compute genre scores for each book
  puts
  book = Book.new(the['title'],the['description'])
  puts book.title
  points = Hash.new(0) # total points for a genre
  counter = Hash.new(0) # total keywords found for a genre
  unique = Hash.new(0) # unique keywords found for a genre
  score = Hash.new(0) # final score for a genre
  genreData.each {|column| # traverse each line of CSV for calculations
    numOfMatches = book.description.scan(column[1]).count
    if numOfMatches > 0 then # if there is a keyword match
      points[column[0]] += column[2].to_i
      counter[column[0]] += numOfMatches
      unique[column[0]] += 1
    end
  }
  genres.each {|genre|
    if unique[genre] > 0 then # compute scores for each found genre
      score[genre] = counter[genre] * points[genre] / unique[genre]
    end}
  sortedScores = score.sort_by {|k,v| -v}.to_h # sort scores descending

  if sortedScores.length > 3 then
    first3 = sortedScores.to_a.slice(0..2)
    first3.each {|x| print x[0],', ',x[1];puts}
  else
    sortedScores.each {|k,v| print k,', ',v;puts}
  end
}
