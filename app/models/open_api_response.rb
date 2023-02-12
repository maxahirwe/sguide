# OpenApiResponse
class OpenApiResponse < ApplicationRecord
  belongs_to :prompt, optional: true
end
