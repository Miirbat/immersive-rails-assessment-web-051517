class GuestsController < ApplicationController
  before_action :authentication_required

  def index
    @guests = Guest.all
  end

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(guest_params)
    if @guest.save
      redirect_to guest_path(@guest)
    else
      render :new
    end
  end

  def edit
    @guest = current_guest
  end

  def update
    @guest = current_guest
    if @guest.update(guest_params)
      redirect_to guest_path(@guest)
    else
      render :edit
    end
  end

  def show
    @guest = current_guest
  end

  def destroy
    current_guest.destroy
    redirect_to guests_path
  end


  private

  def guest_params
    params.require(:guest).permit(:name, :occupation)
  end

  def current_guest
    Guest.find(params[:id])
  end

end
