class CreateTopicPosts < ActiveRecord::Migration
  def change
    create_table :topic_posts do |t|
      t.belongs_to :topic, :index => true
      t.belongs_to :post, :index => true
      t.timestamps
    end
  end
end
