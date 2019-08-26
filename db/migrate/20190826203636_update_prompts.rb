class UpdatePrompts < ActiveRecord::Migration[5.2]
  def change
    rename_column :prompts, :movie_a_url, :movie_a
    rename_column :prompts, :movie_b_url, :movie_b
  end
end
