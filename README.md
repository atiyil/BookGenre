# Detect Book Genres
This is a tool to help editorial teams quickly go through a list
of books and identify the correct genre for each book. It analyzes 
the description of each book and calculate a score based on the presence 
of certain genre-specific keywords. Then it lists first 3 genres having 
the highest scores. Score calculation formula can be easily updated 
due to the need.

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
* Go to the 'lib' folder
* ruby detectBookGenre.rb path-to-jsonfile path-to-csvfile

## Running tests
* Go to the 'test' folder
* ruby path-to-testfile

## Documentation
* Update this document when needed
* Add links to the any app related documentation here

## TO-DO List
* Add tests to improve code quality and maintainability
* Define a module to include all classes under detectBookGenre
