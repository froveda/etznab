class HomeController < ApplicationController
  def index
    @main_header_images = MainHeaderImage.all
    @instagram_images = InstagramImage.show_enabled
    @services = Service.all
    @promos = Promo.all
  end
end
