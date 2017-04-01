class PhotosController < ApplicationController

  def new
    if user_signed_in?
      @photo = Photo.new
    else
      flash[:success] = "Только авторизированные пользователи могут создавать фотографии"
      redirect_to root_path
    end
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    if @photo.save
      flash[:success] = "Фото загружено"
      # redirect_to @category #redirect_to category_url(@category)
      #redirect_to categories_path
      redirect_to "/users/#{@photo.user_id}"
    else
      render 'new'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    if @photo.user_id == current_user.id
      @photo = Photo.find(params[:id]).destroy
      flash[:success] = "Фото удалено"
      redirect_to :back
    else
      flash[:success] = "Вы не можете удалить чужое фото"
      redirect_to :back
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

    private

      def photo_params
        params.require(:photo).permit(:name, :pic)
      end
end
