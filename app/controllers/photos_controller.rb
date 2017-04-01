class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    if @photo.save
      flash[:success] = "Фото загружено"
      # redirect_to @category #redirect_to category_url(@category)
      #redirect_to categories_path
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

    private

      def photo_params
        params.require(:photo).permit(:name, :pic)
      end
end
