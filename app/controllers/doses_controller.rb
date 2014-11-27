class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :edit, :update, :destroy]

  def index
    @doses = Dose.all
  end

  def show

  end

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.create(dose_params)
    if @dose.save
      redirect_to_dose_path(@dose)
    else
      render :new
    end
  end

  def edit

  end

  def update
    @dose.update(dose_params)
    if @dose.save
      redirect_to_dose_path(@dose)
    else
      render :edit
    end
  end

  def destroy
    @dose.destroy
    redirect_to_doses_path
  end

  private

  def dose_params
    params.require(:dose).permit(:name)
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end
end
