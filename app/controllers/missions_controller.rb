class MissionsController < ApplicationController
  def index
    @missions = Missions.all 
    respond_to do |format|
      format.json { render json: @missions }
    end 
  end 
end
