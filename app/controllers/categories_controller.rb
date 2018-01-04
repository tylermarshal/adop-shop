class CategoriesController < ApplicationController

  def show
    @category = Category.find_by(slug: params[:id])
  end

  def index
    @categories = Category.order(:title)
  end


end
