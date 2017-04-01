class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
        if @comment.save
          flash[:success] = "Комментарий добавлен"
          redirect_to "/photos/#{@comment.photo_id}"
        else
          flash[:error] = "Правильно заполните поля"
          redirect_to "/photos/#{@comment.photo_id}"
        end
  end

  def destroy
    @comment = Comment.destroy(params[:id])
    redirect_to "/photos/#{@comment.photo_id}"
  end


    private

    def comment_params
      params.require(:comment).permit(:content, :photo_id, :star)
    end
end
