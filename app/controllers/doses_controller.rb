class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    # We are nesting that why we dont use id but rather cocktail_id
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    # @dose = Dose.new(dose_params)
    # @dose.cocktail = @cocktail
    @dose = @cocktail.doses.new(dose_params)
    # We can use cocktails with doses because its associated together with belongs to
    if @dose.save
      redirect_to @cocktail
    else
      render :new
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:amount, :ingredient_id)
     # We have a big list of ingredients already in our seeds we are associating the id with them
  end
end
