# Prompt
class Prompt < ApplicationRecord
  OPEN_API_ENDPOINT = ENV['OPEN_API_ENDPOINT'].freeze
  OPEN_API_KEY = "Bearer #{ENV['OPEN_API_KEY']}".freeze
  OPEN_API_MODEL = 'code-cushman-001'.freeze
  OPEN_API_MODEL_TEMPERATURE = 0
  OPEN_API_MODEL_TOKEN_LIMIT = 50
  has_many :open_api_responses, foreign_key: 'prompts_id'
  validates :prompt, length: { minimum: 2, maximum: 140 }, presence: true
  validates :language, :user_id, presence: true
  before_create :process_prompt

  private

  def process_prompt
    prompt = formulate_prompt
    self.prompt_raw = prompt.to_s
    self.request_time = DateTime.now
    self.endpoint = OPEN_API_ENDPOINT
  end

  def formulate_prompt
    {
      model: OPEN_API_MODEL,
      prompt: "#{prompt}. strictly in (#{language}) programming language",
      temperature: OPEN_API_MODEL_TEMPERATURE,
      max_tokens: OPEN_API_MODEL_TOKEN_LIMIT
    }
  end

  def formulate_response(body)
    {
      prompts_id: id,
      content: body['choices'].first['text'],
      raw: body.to_s,
      model: body['model'],
      prompt_tokens: body['usage']['prompt_tokens'].to_i,
      completion_tokens: body['usage']['completion_tokens'].to_i,
      total_tokens: body['usage']['total_tokens'].to_i
    }
  end

  def create_response(body)
    open_api_responses.build(formulate_response(body)).save!
  end

  public

  def process_openapi_response
    headers = { 'Content-Type' => 'application/json', Authorization: OPEN_API_KEY }
    response = HTTParty.post(OPEN_API_ENDPOINT, body: formulate_prompt.to_json, headers: headers)
    self.request_time = DateTime.now
    save
    create_response(response.parsed_response)
  end
end
