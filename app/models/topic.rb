class Topic < ActiveRecord::Base
	belongs_to :user
	has_many :topic_posts
	has_many :posts, :through => :topic_posts, :dependent => :destroy
end
