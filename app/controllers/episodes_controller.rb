class EpisodesController < ApplicationController
  before_action :authentication_required

  def index
    @episodes = Episode.all
  end

  def new
    @episode = Episode.new
  end

  def create
    @episode = Episode.new(episode_params)
    if @episode.save
      redirect_to episode_path(@episode)
    else
      render :new
    end
  end

  def edit
    @episode = current_episode
  end

  def update
    @episode = current_episode
    if @episode.update(episode_params)
      redirect_to episode_path(@episode)
    else
      render :edit
    end
  end

  def show
    @episode = current_episode
  end

  def destroy
    current_episode.destroy
    redirect_to episodes_path
  end


  private

  def episode_params
    params.require(:episode).permit(:date, :number)
  end

  def current_episode
    episode.find(params[:id])
  end

end
