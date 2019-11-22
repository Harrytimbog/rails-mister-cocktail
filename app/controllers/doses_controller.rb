class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @Cocktail = Cocktail.find(params[:Cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.Cocktail = @Cocktail
    @dose.save

    # redirect_to Cocktail_path(@Cocktail)
    redirect_to @Cocktail
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    redirect_to @dose.cocktail
  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end
end
