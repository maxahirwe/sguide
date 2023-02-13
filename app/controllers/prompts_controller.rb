# handles all prompts business logic
class PromptsController < ApplicationController
  before_action :set_prompt, only: %i[show]

  # GET /prompts or /prompts.json
  def index
    @supported_languages = ['Ruby', 'JavaScript', 'Python', 'C++']
    @prompts = Prompt.includes(:open_api_responses).last(20).reverse
    @prompts_count = Prompt.count
    @prompt = Prompt.new
  end

  # GET /prompts/1 or /prompts/1.json
  def show; 
    render json: @prompt 
  end

  # POST /prompts or /prompts.json
  def create
    user_id = 1 # if authentication is available  we should use a real user id reference
    @prompt = Prompt.new({ **prompt_params, user_id: user_id })
    respond_to do |format|
      if @prompt.save
        @prompt.process_openapi_response
        format.js { render :create, locals: { prompt: @prompt, pcount:Prompt.count } }
      else
        format.js { render :error }
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
