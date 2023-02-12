# migration for responses table
class CreateOpenApiResponses < ActiveRecord::Migration[6.0]
  def up
    create_table :open_api_responses do |t|
      t.text :content, null: true
      t.text :raw, null: true
      t.string :model, null: false
      t.integer :prompt_tokens, null: false
      t.integer :completion_tokens, null: false
      t.integer :total_tokens, null: false
      t.timestamps
    end
    add_reference :open_api_responses, :prompts, foreign_key: true
  end

  def down
    drop_table :open_api_responses
  end
end
