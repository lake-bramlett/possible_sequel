class Post < ApplicationRecord
  belongs_to :user
  belongs_to :prompt

  def upvote
    ActiveRecord::Base.connection.execute("UPDATE posts SET votes = votes + 1 WHERE id = #{self.id}")
  end

  def self.get_by_prompt(prompt_id)
    ActiveRecord::Base.connection.execute("SELECT * FROM posts WHERE prompt_id=#{prompt_id}")
  end
end
