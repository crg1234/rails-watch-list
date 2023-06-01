class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def new # GET
    @list = List.new
  end

  def create # POST
    @list = List.create(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit # GET
    @list = List.find(params[:id])
  end

  def show
    @list = List.find(params[:id])
    # @bookmarks = Bookmark.where(list_id: @list.id)  <- because I have has_many... belongs_to...
    # @movies = Movie.where(id: @bookmarks.pluck(:movie_id))
  end

  def update # PATCH
    @list = List.find(params[:id])
    @list.update(list_params)
    redirect_to list_path(@list)
  end

  def destroy
    @list = List.find(params[:id]).destroy
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
