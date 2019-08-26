class CreatePrompts < ActiveRecord::Migration[5.2]
  def change
    create_table :prompts do |t|
      t.string :movie_a_url
      t.string :movie_b_url

      t.timestamps
    end
  end
end
