require './detectBookGenre/book'
require 'json'
require 'csv'

# read and parse the json file to get books' data
begin
file = File.read('../data/'.concat(ARGV[0]))
rescue Exception => e
  abort e.message
end
books = JSON.parse file

# get genre names, keywords and corresponding points
begin
genreData = CSV.read('../data/'.concat(ARGV[1]))
rescue Exception => e
  abort e.message
end

# get rid of first line which is title
genreData.shift

# get unique genre names
genres = genreData.transpose[0].uniq

# sort books alphabetically
sortedBooks = books.sort_by {|x| x['title']}

sortedBooks.each {|the| # compute genre scores for each book
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
      points[column[0]] += column[2].to_i # update points
      counter[column[0]] += numOfMatches # update total keywords found
      unique[column[0]] += 1 # update unique keywords found
    end
  }
  genres.each {|genre|
    if unique[genre] > 0 then # compute scores for each found genre
      score[genre] = counter[genre] * points[genre] / unique[genre]
    end}

  sortedScores = score.sort_by {|k,v| -v}.to_h # sort scores descending

  if sortedScores.length > 3 then # if more than 3 genres exist
    first3 = sortedScores.to_a.slice(0..2) # take highest 3 genre
    first3.each {|x| print x[0],', ',x[1];puts}
  else
    sortedScores.each {|k,v| print k,', ',v;puts}
  end
}
puts
