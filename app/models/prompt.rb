# Prompt
class Prompt < ApplicationRecord
  has_many :responses
  validates :prompt, length: { minimum: 2, maximum: 140 }, presence: true
  validates :language, :prompt_raw, :endpoint, presence: true
end
