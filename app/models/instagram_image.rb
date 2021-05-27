require 'uri'

class InstagramImage < ActiveRecord::Base
  include InstagramImageConcern

  default_scope { order(post_date: :desc) }

  validates :instagram_id, presence: true, uniqueness: { scope: :code }, numericality: true
  validates :code, presence: true
  validates :thumbnail_src, presence: true, url: true

  scope :show_enabled, -> { where(show: true) }

  def video_url_insecure
    video_url.gsub(/https/, 'http')
  end
end
