class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @posts = []
    else
      @posts = Post.search params[:q]
    end
  end


  def self.search(query)
    __elasticsearch__.search(
        {
            query: {
                multi_match: {
                    query: query,
                    fields: ['title^10', 'text']
                }
            },
            highlight: {
                pre_tags: ['<em>'],
                post_tags: ['</em>'],
                fields: {
                    title: {},
                    text: {}
                }
            }
        }
    )
  end

end
