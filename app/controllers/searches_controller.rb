class SearchesController < ApplicationController

  def show
    @search = Search.find(params[:id])
  end

  def new
    @search = Search.new
    @genre = Genre.uniq.pluck(:name)
  end

  def create
    @search = Search.create(search_params)
    if @search.save
      redirect_to @search
    else
      render :new, status: :unprocessable_entity
    end
  end

  def search_params
    params.require(:search).permit(:keywords, :min_price, :max_price, :isbn13, :genre, :author, :publisher)
  end
end
