class PlayersController < ApplicationController

  def show
    render json: { message: "hello" }
  end

end