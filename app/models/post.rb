class Post < ActiveRecord::Base

  def self.trim(age_limit=1.year)
    Post.delete_all ['created_at < ?', age_limit.ago]
  end
end
