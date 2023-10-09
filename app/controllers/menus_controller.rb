class MenusController < ApplicationController

  # GET /menus
  def index
    @menus = Menu.paginate(page: params[:page], per_page: params[:per_page])
  end

  # GET /menus/1
  def show
    @menu = Menu.find(params[:id])
  end

  #SORT menus by name and price menus/sort?sort_by=name&order=desc
  def sort
    sort_by = params[:sort_by]
    order = params[:order]
    case sort_by
    when 'name'
      @menus = Menu.order(name: order)
    when 'price'
      @menus = Menu.order(price: order)
    else
      # Handle invalid sorting options, or provide a default sorting
      @menus = Menu.all
    end
    render json: @menus
  end

  # POST /menus
  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      @menu
    else
      render json: @menu.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /menus/1
  def update
    @menu = Menu.find(params[:id])
    if @menu.update(menu_params)
      @menu
    else
      render json: @menu.errors, status: :unprocessable_entity
    end
  end

  # DELETE /menus/1
  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
  end

  private

  # Only allow a trusted parameter "white list" through.
  def menu_params
    params.require(:menu).permit(:name, :price)
  end

end
