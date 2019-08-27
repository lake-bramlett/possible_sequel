class ChangePromptsDataTypes < ActiveRecord::Migration[5.2]
  def change
    change_column :prompts, :movie_a, :hstore, default: {}, null: false
    change_column :prompts, :movie_b, :hstore, default: {}, null: false
  end
end
