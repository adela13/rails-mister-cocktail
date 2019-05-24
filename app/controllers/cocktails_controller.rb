class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]
  def index
    @cocktails = Cocktail.all        # GET /restaurants
  end

  def show          # GET /restaurants/:id
  end

  def new
    @cocktails = Cocktail.new        # GET /restaurants/new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to ccocktail_path
    else
      render :new
    end      # POST /restaurants
  end

  def edit          # GET /restaurants/:id/edit
  end

  def update        # PATCH /restaurants/:id
  end

  def destroy
    @cocktail.destroy
    respond_to do |format|
    format.html { redirect_to cocktail_url, 'Cocktail was successfully deleted.'}
    format.json { head :no_content}      # DELETE /restaurants/:id
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params [:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
