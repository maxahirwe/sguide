class ApplicationController < ActionController::Base
  def index
    @prompts = [
      { language: 'Ruby', prompt: 'Write a method that takes in a string and returns the number of vowels in the string.',
        created_at: DateTime.now, response: 'sample response' },
      { language: 'JavaScript',
        prompt: 'Create a function that takes in an array of numbers and returns the sum of all the even numbers in the array.', created_at: DateTime.now, response: 'sample response' },
      { language: 'Python',
        prompt: 'Write a function that takes in a string and returns the first non-repeated character in the string.', created_at: DateTime.now, response: 'sample response' },
      { language: 'C++',
        prompt: 'Create a program that reads in a list of integers and outputs the largest and smallest numbers in the list.', created_at: DateTime.now, response: 'sample response' },
      { language: 'Ruby',
        prompt: 'Write a method that takes in an array of integers and returns the median value of the array.', created_at: DateTime.now, response: 'sample response' }
    ]

    @prompt = { language: 'Javascript' }
    @promp

    render 'home/index'
  end
end
