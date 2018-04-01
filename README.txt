<Any steps necessary to run your program>
# Auto-detect Book Genres

This is a tool to help BookBub’s editorial team quickly go through a list
of books and identify the correct genre for each book. The approach we’re
taking is to analyze the description of each book and calculate a score
based on the presence of certain genre-specific keywords.

## Environment Setup
* Install Ruby 2.3 or later

## Application Setup
* Unzip source folder
* Add any executables needed into 'bin' folder
* Add any data files (json, csv) needed into 'data' folder
* Add any other language extension into 'ext' folder
* Add new modules/classes into 'lib' folder
* Add any RSpec tests into 'spec' folder
* Add any test files into 'test' folder

## Application Start
* ruby detectBookGenre.rb jsonfile csvfile

## Documentation
* Update this document when needed
* Add links to the any app related documentation here

<Any interesting trade-offs or edge cases you ran into>
- calculating score using average points was tricky compared to
  calculating by total points by each keyword
- instead of looping by genre and then by keywords, I used csv lines to
  prevent duplication
- I had to use an array to choose top 3 genres out of a hash
- I would add alphabetic sort for books and more comments if I had more time
- I would add tests to improve code quality and maintainability
- I would define a module to include all classes under detectBookGenre

<Approximately how long you spent>
3 hours
