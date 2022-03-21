class ListsController < ApplicationController
  def index
    @user = current_user
    @lists = List.where(user_id: @user)
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
    @bookmark = Bookmark.new
    @movie = Movie.new
  end

  def new
    @user = current_user
    @list = List.new
  end

  def create
    @user = current_user
    @list = List.new(list_params)
    @list.user = @user
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @user = current_user
    @list = List.find(params[:id])
    @list.update(list_params)
    redirect_to lists_path(@list)
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :image)
  end
end
