class CategoriesController < ApplicationController
  respond_to :html, :json
  
  before_action :find_category, only: [:show, :edit, :update, :destroy]
  before_action :disable_extras, only: [:new, :create, :update, :edit]
  before_action :sidebar_variables, only: :show

  layout 'categories_sidebar', only: :show

  def show
    @posts = @category.posts.filter(params).paginate(page: params[:page], per_page: 3)
    @tags = @category.tags.order_by_size
  end

  def create
    @category = Category.new category_params
  end

  def update
    if @category.update(category_params)
      redirect_to @category, success: "Categoria atualizada com sucesso."
    else
      render 'edit'
    end
  end

  def autocomplete
    @categories = Category.order(:name)
    respond_with(@category) do |format|
      format.json { render json: @categories.tokens(params[:q]) }
    end
  end

  private

  def find_category
    @category = Category.find_by_slug!(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end
end