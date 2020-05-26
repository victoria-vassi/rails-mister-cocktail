class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:destroy, :show, :edit, :update]

  def index
    @cocktails = policy_scope(Cocktail).order(created_at: :desc)
  end

  def show
    @ingredients = @cocktail.ingredients

    authorize @cocktail
  end

  def new
    @cocktail = Cocktail.new
    authorize @cocktail
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.user = current_user
    authorize @cocktail

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @cocktail.update(cocktail_params)

    redirect_to cocktail_path(@cocktail)
    authorize @cocktail
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
    authorize @cocktail
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :image_url, :description, :photo)
  end
end
