class AppearancesController < ApplicationController
  before_action :authentication_required

  def index
    @appearances = Appearance.all
  end

  def new
    @appearance = Appearance.new
  end

  def create
    @appearance = Appearance.new(appearance_params)
    if @appearance.save
      redirect_to appearance_path(@appearance)
    else
      render :new
    end
  end

  def edit
    @appearance = current_appearance
  end

  def update
    @appearance = current_appearance
    if @appearance.update(appearance_params)
      redirect_to appearance_path(@appearance)
    else
      render :edit
    end
  end

  def show
    @appearance = current_appearance
  end

  def destroy
    current_appearance.destroy
    redirect_to appearances_path
  end


  private

  def appearance_params
    params.require(:appearance).permit(:guest_id, :episode_id, :rating)
  end

  def current_appearance
    Appearance.find(params[:id])
  end
