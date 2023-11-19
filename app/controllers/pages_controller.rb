class PagesController < ApplicationController

  http_basic_authenticate_with name: "admin", password: "123456", except: [:index, :show]
  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to @page
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])

    if @page.update(page_params)
      redirect_to @page
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # destroy method to delete a page object from Page table (model) in the database
  # find id parameters of the a page object from the resquest and assign it to an instance varible @page
  # call the destroy method on the @page object to delete it from database
  # redirect to index method of @page object
  # status: :see_other to redirect another action with a 303 status code, which indicates the resource can be found at a different location.
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    redirect_to action: 'index', status: :see_other
  end

  # private method
  # params is an instance of ActionController::Parameters
  # require method used to return an instance for the key :page passed into require.
  # permit returns a copy of the parameters object only the permitted keys and values (:title, :content, :status)
  private
  def page_params
    params.require(:page).permit(:title, :content, :status)
  end
end
