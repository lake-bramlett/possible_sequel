class ChangeVoteDefaultValue < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :votes, :integer, :default => 0
  end
end
