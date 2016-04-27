class Channel < ActiveRecord::Base
  has_many :posts
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :description, presence: true,
                    length: { minimum: 5 }
end
