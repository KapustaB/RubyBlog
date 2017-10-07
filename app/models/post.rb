class Post < ApplicationRecord
  acts_as_votable
  include Impressionist::IsImpressionable
  is_impressionable counter_cache: true

  attr_accessor :remove_image

  has_many :comments
  belongs_to :user
  has_one :picture

  has_many :post_categories
  has_many :categories, :through => :post_categories

end
