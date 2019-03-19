[Double Word Square](https://en.wikipedia.org/wiki/Word_square#Double_word_squares)
generator.

I scrapped thousands of words and their definitions from a crossword solver site to use as my dictionary
then wrote a program that would find and display valid word squares.

To use, run a rails server in the terminal:
```
rails s
```
Then navigate to localhost:3000 in a browser
The first few pages explain double word squares and show how the program works.

To see the word squares themselves goto:
localhost:3000/answer/*some letter here*/*number of solution or 'r' for random

ex -
localhost:3000/answer/t/5
will show the 5th solution using starting words that start with 't'

localhost:3000/answer/d/r
will show a random solution using starting words that start with 'd'
