module ApplicationHelper
  def find_avarege_score(id)
    @photo = Photo.find(id)
    count_row = @photo.comments.count
    if count_row == 0
      return "no votes"
    else
      sum_row = @photo.comments.sum(:star)*1.0
      stars = sum_row/count_row
      format("%.1f", stars)
    end
  end
end
