class LikesController < ApplicationController
  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)
    authorize like
    if like.save
      flash[:notice] = "Bookmark Liked!"
      redirect_to :back
    else
      flash[:error] = "Error, try again!"
      redirect_to :back
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])
    authorize like
    if like.destroy
      flash[:notice] = "Bookmark Unliked"
      redirect_to :back
    else
      flash[:error] = "Error, try again"
      redirect_to :back
    end
  end
end
