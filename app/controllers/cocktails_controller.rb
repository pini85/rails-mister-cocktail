class CocktailsController < ApplicationController
   before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to @cocktail, notice: "A new cocktail was successfully created"
    else
      render :new

    end
  end

    def edit
  end

  def update
    if @cocktail.update(cocktail_params)
      redirect_to @cocktail, notice: "Your cocktail was successfully updated."
    else
      render :edit
    end

    def destroy
      # @cocktail = Cocktail.find(params[:id])
      @cocktail.destroy

      # @cocktail.photo.destroy
      # @cocktail.photocloudinary.uploader.destroy
      redirect_to cocktails_path, notice: "Cocktail was successfully deleted"
    end
  end
  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end


