# encoding: utf-8
namespace :instagram_feed do

  desc "Import instagram images for #etznabpeluqueria and #etznabbarberia"
  task :import_images => :environment do
    require 'mechanize'

    ['etznabpeluqueria','etznabbarberia'].each do |instagram_hashtag|
      create_images(instagram_hashtag)
    end
  end

  def create_images(instagram_hashtag)
    uri = "https://www.instagram.com/explore/tags/#{instagram_hashtag}"
    while uri
      puts "------ URL: " + uri

      agent = Mechanize.new
      begin
        result = agent.get(uri)

        o = result.body.match(/window\._sharedData *= *(.*?) *\;? *<\/script>/i).captures
        o = JSON.parse(o[0])
        data = o['entry_data']['TagPage'][0]['tag']['media']['nodes']

        data.each do |instagram_data|
          begin
            unless InstagramImage.where(instagram_id: instagram_data['id'], code: instagram_data['code']).count > 0
              puts "------ CARGA #{instagram_data['id']}, #{instagram_data['code']}"
              InstagramImage.create(instagram_id: instagram_data['id'],
                                    code: instagram_data['code'],
                                    thumbnail_src: instagram_data['thumbnail_src'],
                                    display_src: instagram_data['display_src'],
                                    display_src_image: URI.parse(instagram_data['display_src']),
                                    thumbnail_src_image: URI.parse(instagram_data['thumbnail_src']),
                                    post_date: DateTime.strptime("#{instagram_data['date']}",'%s'))
              puts "------ CARGO #{instagram_data['id']}, #{instagram_data['code']}"
            end
          rescue => e
            puts "------ ERROR DE CARGA: #{e}"
          end
        end

        sleep 10
        page_info = o['entry_data']['TagPage'][0]['tag']['media']['page_info']
        max_id = page_info['end_cursor']
        has_next_page = page_info['has_next_page']
        uri = has_next_page ? "https://www.instagram.com/explore/tags/#{instagram_hashtag}/?max_id=#{max_id}" : nil
      rescue => e
        uri = nil
        puts "------ ERROR DE PAGINA: #{e}"
      end
    end
  end
end