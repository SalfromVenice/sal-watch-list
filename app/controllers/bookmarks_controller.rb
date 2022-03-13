class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
    @movie = Movie.find(params[:movie_id])
  end

  def create
    @bookmark = Bookmark.new(bm_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = List.find(@bookmark.list_id)
    @bookmark.list = @list
    @bookmark.destroy
    redirect_to list_path(@list)
  end

  private

  def bm_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
