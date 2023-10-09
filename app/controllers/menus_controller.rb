class MenusController < ApplicationController
  
  # GET /menus
  def index
    binding.pry
    @menus = Menu.all
  end

  # GET /menus/1
  def show
    @menu = Menu.find(params[:id])
  end

  # POST /menus
  def create
    binding.pry
    @menu = Menu.new(menu_params)

    if @menu.save
      @menu
    else
      render json: @menu.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /menus/1
  def update
    if @menu.update(menu_params)
      @menu
    else
      render json: @menu.errors, status: :unprocessable_entity
    end
  end

  # DELETE /menus/1
  def destroy
    @menu.destroy
  end

private

  # Only allow a trusted parameter "white list" through.
  def menu_params
    params.require(:menu).permit(:name, :price)
  end

end
