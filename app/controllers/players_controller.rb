class PlayersController < ApplicationController

  def index
    render json: Player.all
  end

  def show
    render json: Player.find_by(id: params[:id])
  end
end