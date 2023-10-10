class Api::V1::MenusController < ApplicationController
  before_action :check_for_sort
  # GET /menus
  def index
    @menus = Menu.all
    @menus = @menus.where('name LIKE ?', "%#{params[:name]}%") if params[:name]
    @menus = @menus.order(price: params[:sort_by].to_sym) if params[:sort_by]
    @menus = @menus.paginate(page: params[:page], per_page: params[:per_page])
  end

  private

  def check_for_sort
    if params[:sort_by].present?
      unless %w(asc desc).include?(params[:sort_by])
        render json: {
          message: "please select sort by asc or desc"
        }, status: 422 and return 
      end
    end
  end

end
