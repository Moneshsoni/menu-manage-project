class MenusController < ApplicationController

  # GET /menus
  def index
    # @menus = Menu.all
    @menus = Menu.paginate(page: params[:page], per_page: params[:per_page])
  end

  # GET /menus/1
  def show
    @menu = Menu.find(params[:id])
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
