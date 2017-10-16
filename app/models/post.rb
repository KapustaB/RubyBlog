require 'elasticsearch/model'

class Post < ApplicationRecord
  acts_as_votable
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

end

Post.import # for auto sync model with elastic search