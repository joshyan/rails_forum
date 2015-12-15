class Post < ActiveRecord::Base
	belongs_to :user
	has_many :topic_posts
	has_many :topics, :through => :topic_posts
	has_many :replies, :dependent => :destroy
end
