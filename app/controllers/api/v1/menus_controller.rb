class Api::V1::MenusController < ApplicationController
 
  # GET /menus
  def index
    @menus = Menu.all
    @menus = @menus.where('name LIKE ?', "%#{params[:name]}%") if params[:name]
    @menus = @menus.paginate(page: params[:page], per_page: params[:per_page])
  end

  # GET /sort
  def sort
    sort_by = params[:sort_by]
    order = params[:order]
    valid_sort_columns = %w[name price]
    if valid_sort_columns.include?(sort_by)
      @menus = Menu.order(sort_by => order)
    else
     @menus = Menu.all
    end
    @menus = @menus.paginate(page: params[:page], per_page: params[:per_page])
  end
end