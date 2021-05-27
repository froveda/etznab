# frozen_string_literal: true

namespace :instagram_feed do
  desc 'Import instagram images for #etznabpeluqueria and #etznabbarberia'
  task import_images: :environment do
    require 'mechanize'

    %w[etznabpeluqueria etznabbarberia].each do |instagram_hashtag|
      create_images(instagram_hashtag)
    end
  end

  def create_images(instagram_hashtag)
    uri = "https://www.instagram.com/explore/tags/#{instagram_hashtag}"
    while uri
      puts "------ URL: #{uri}"
      begin
        result = agent.get(uri)
        sleep 10
        response = JSON.parse(result.body.match(%r{window\._sharedData *= *(.*?) *;? *</script>}i).captures[0])
        create_instagram_images(get_data(response))
        uri = next_page(response, instagram_hashtag)
      rescue StandardError => e
        uri = nil
        puts "------ ERROR DE PAGINA: #{e}"
      end
    end
  end

  def agent
    @agent ||= Mechanize.new
  end

  def get_data(response)
    response['entry_data']['TagPage'][0]['tag']['media']['nodes']
  end

  def next_page(response, instagram_hashtag)
    page_info = response['entry_data']['TagPage'][0]['tag']['media']['page_info']
    max_id = page_info['end_cursor']
    has_next_page = page_info['has_next_page']
    has_next_page ? "https://www.instagram.com/explore/tags/#{instagram_hashtag}/?max_id=#{max_id}" : nil
  end

  def get_video_url(instagram_data)
    video_url = ''
    if instagram_data['is_video']
      video_page = agent.get("https://www.instagram.com/p/#{instagram_data['code']}")
      sleep 5
      videos = video_page.body.match(/content=['"](.*?\.mp4)['"]/i).captures
      video_url = videos.first
    end
    video_url
  end

  def instagram_image_exists?(instagram_data)
    InstagramImage.where(instagram_id: instagram_data['id'], code: instagram_data['code']).count.positive?
  end

  def create_instagram_images(data)
    data.each do |instagram_data|
      create_instagram_image(instagram_data) unless instagram_image_exists?(instagram_data)
    end
  end

  def create_instagram_image(instagram_data)
    video_url = get_video_url(instagram_data)
    puts "------ CARGA #{instagram_data['id']}, #{instagram_data['code']}"
    InstagramImage.create(instagram_id: instagram_data['id'],
                          code: instagram_data['code'],
                          thumbnail_src: instagram_data['thumbnail_src'],
                          display_src: instagram_data['display_src'],
                          display_src_image: URI.parse(instagram_data['display_src']),
                          thumbnail_src_image: URI.parse(instagram_data['thumbnail_src']),
                          post_date: DateTime.strptime((instagram_data['date']).to_s, '%s'),
                          video_url: video_url,
                          is_video: instagram_data['is_video'])
    puts "------ CARGO #{instagram_data['id']}, #{instagram_data['code']}"
  rescue StandardError => e
    puts "------ ERROR DE CARGA: #{e}"
  end
end
