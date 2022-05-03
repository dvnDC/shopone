class SubcategoriesController < ApplicationController
  def show
    @subcategory = Subcategory.find(params[:id])
    @items = @subcategory.items.paginate(page: params[:page], :per_page => 16)
    @subcategories = @items
  end

  private

  def subcategory_params
    params.require(:subcategory)
  end
end

