class PostsByWeek
  def initialize(number_of_posts)
    @posts = Post.all
    @return_number_of_posts = number_of_posts
  end

  def get_most_viewed_posts
    get_posts_by_week.sort_by {|post| post.impressionist_count(:filter=>:ip_address)}.reverse.first(return_number_of_posts)
  end

  def get_most_liked_posts
    get_posts_by_week.sort_by {|post| post.cached_votes_up}.reverse.first(return_number_of_posts)
  end

  private

  attr_reader :posts, :return_number_of_posts

  def get_posts_by_week
    cnt=0
    posts_by_week = []
    begin
      temp_posts = posts.where("created_at >= ? and created_at <= ?", (cnt+1).week.ago.utc, (cnt).week.ago.utc )
      posts_by_week.concat temp_posts unless temp_posts.empty?
      cnt += 1
      return if cnt > 20
    end until posts_by_week.count > return_number_of_posts
    #binding.pry
    posts_by_week.sort_by {|post| post.created_at}
  end
end