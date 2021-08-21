class TeamsController < ApplicationController
  
  def create
    team = Team.new(
      name: params[:name],
      user_id: params[:user_id],
      player_ids: params[:player_ids]
    )
    if team.save
      render json: {message: 'Team created successfully'}, status: :created
    else
      render json: {errors: team.errors.full_messages}, status: :bad_request
    end
  end

end