# migration for prompts table
class CreatePrompts < ActiveRecord::Migration[6.0]
  def up
    create_table :prompts do |t|
      t.integer :user_id, null: true
      t.string :language, null: false
      t.text :prompt, null: false
      t.text :prompt_raw, null: true
      t.string :endpoint, null: false
      t.datetime :request_time, null: true
      t.datetime :response_time, null: true
      t.timestamps
    end
  end

  def down
    drop_table :prompts
  end
end
