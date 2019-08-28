class Post < ApplicationRecord
  belongs_to :user
  belongs_to :prompt

  def self.get_by_prompt(prompt_id)
    ActiveRecord::Base.connection.execute("SELECT * FROM posts WHERE prompt_id=#{prompt_id}")
  end
end
