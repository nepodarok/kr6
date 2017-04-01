class HomeController < ApplicationController
  def index
    @photos = Photo.paginate(:page => params[:page], :per_page => 3)
  end
end
