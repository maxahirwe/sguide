# handles all prompts business logic
class PromptsController < ApplicationController
  before_action :set_prompt, only: %i[show edit update destroy]

  # GET /prompts or /prompts.json
  def index
    @supported_languages = ['Ruby', 'JavaScript', 'Python', 'C++']
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
    @prompt = Prompt.new
    # @prompts = Prompt.all
  end

  # GET /prompts/1 or /prompts/1.json
  def show; end

  # GET /prompts/new
  def new
    @prompt = Prompt.new
  end

  # GET /prompts/1/edit
  def edit; end

  # POST /prompts or /prompts.json
  def create
    endpoint = ENV['OPEN_API_ENDPOINT']
    key = ENV['OPEN_API_KEY']
    p prompt_params
    @prompt = Prompt.new(prompt_params)
    # response = HTTParty.post(endpoint, body: {
    #   model: 'curie',
    #   prompt: @prompt.prompt,
    #   temperature: 0,
    #   max_tokens: 5
    # }.to_json, headers: { 'Content-Type' => 'application/json', Authorization: "Bearer #{key}" })
    print "response#{response}"
    respond_to do |format|
      if @prompt.save
        # format.html { redirect_to prompt_url(@prompt), notice: 'Prompt was successfully created.' }
        # format.json { render :show, status: :created, location: @prompt }
        format.js { render :create, locals: { prompt: @prompt } }

      else
        # format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @prompt.errors, status: :unprocessable_entity }
        # add error here
        format.js
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_prompt
    @prompt = Prompt.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def prompt_params
    params.require(:prompt).permit(:language, :prompt)
  end
end
