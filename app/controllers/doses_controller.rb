class DosesController < ApplicationController
   before_action :set_dose, only: [:new, :create, :destroy]


  def new           # GET /restaurants/new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.save
         # POST /restaurants
         redirect_to cocktail_path
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @cocktail.dose
    @dose.destroy
    redirect_to cocktail_path(@cocktail)      # DELETE /restaurants/:id
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:review).permit(:description)
  end

end
