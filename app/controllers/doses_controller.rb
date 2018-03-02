class DosesController < ApplicationController

  def destroy
    dose = Dose.find(params[:id])
    dose.destroy
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create

    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(get_params)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def get_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
