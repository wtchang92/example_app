class Crawl < ActiveRecord::Base
   belongs_to :user
   validates :title, presence: true
  validates :user_id, presence: true
  validates :stops, presence: true
end