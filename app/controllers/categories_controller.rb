class CategoriesController < ApplicationController
  def index
  end

  def new
  end

  def show
    @category = Category.find(params[:id])
    @subcategories = @category.subcategories.paginate(page: params[:page], :per_page => 12)
  end

  def edit
  end

  def update
  end

  private

  def category_params
    params.require(:category)
  end
end