class DosesController < ApplicationController
  before_action :get_cocktail

  def new
    @ingredients = Ingredient.all
    @dose = Dose.new(cocktail: @cocktail)
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

private

  def dose_params
    params.require(:dose).permit(:amount, :ingredient_id)
  end

  def get_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end
