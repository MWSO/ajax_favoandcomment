class AddFollowerToRelationships < ActiveRecord::Migration[6.1]
  def change
    add_column :relationships, :follower, :integer
  end
end
