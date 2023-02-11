# migration for responses table
class CreateResponses < ActiveRecord::Migration[6.0]
  def up
    create_table :responses do |t|
      t.text :content
      t.text :raw
      t.string :model
      t.integer :prompt_tokens
      t.integer :completion_tokens
      t.integer :total_tokens
      t.timestamps
    end
    add_reference :responses, :prompts, foreign_key: true
  end

  def down
    drop_table :responses
  end
end
