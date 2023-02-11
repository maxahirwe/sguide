# Prompt Response
class Response < ApplicationRecord
  belongs_to :prompt
  validates :content, :raw, :model, :prompt_tokens, :completion_tokens, :total_tokens, presence: true
end
