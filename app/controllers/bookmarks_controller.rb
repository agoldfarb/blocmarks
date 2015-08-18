class BookmarksController < ApplicationController
  def show
    @topic = Topic.find(params[:topic_id])
    @bookmarks = @topic.bookmarks
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Bookmark saved!"
      redirect_to @topic
    else
      flash[:error] = "Error creating bookmark. Please try again."
      render :new
    end
   end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    @bookmark.save
  end
  
  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    
    if @bookmark.update_attributes(params.require(:bookmark).permit(:url))
      flash[:notice] = "Bookmark was updated."
      redirect_to @topic
    else
      flash[:error] = "There was an error saving the bookmark. Please try again."
      render :edit
    end
  end
  
  def destroy
    @bookmark = Bookmark.find(params[:id])
 
    if @bookmark.destroy
      flash[:notice] = "Bookmark was deleted successfully."
      redirect_to topics_path
    else
      flash[:error] = "There was an error deleting the bookmark."
      render :show
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url, :topic_id)
  end
end


