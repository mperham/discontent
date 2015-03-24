class FilterObscenityJob < ActiveJob::Base
  queue_as :default

  def perform(post_id)
    post = Post.find(post_id)
    post.title = sanitize(post.title)
    post.body = sanitize(post.body)
    post.save!
  end

  private

  BLACKLIST = {
    'poop' => 'dookie',
    'butt' => 'bottom',
  }

  def sanitize(str)
    BLACKLIST.each do |bad, good|
      str.gsub!(bad, good)
    end
    str
  end
end
