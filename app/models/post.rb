class Post < ActiveRecord::Base
  belongs_to :channel
  has_many :comments
end
