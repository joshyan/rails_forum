class RemoveParentIdFromPosts < ActiveRecord::Migration
  def change
  	remove_column :posts, :parent_id
  end
end
