require 'elasticsearch/model'

class Post < ApplicationRecord
  acts_as_votable
  resourcify
  include Impressionist::IsImpressionable
  is_impressionable counter_cache: true
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  attr_accessor :remove_image

  has_many :comments
  belongs_to :user
  has_one :picture

  has_many :post_categories
  has_many :categories, :through => :post_categories

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
                pre_tags: ['<em class=“label label-highlight” style=“color: blue;“>'],
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

