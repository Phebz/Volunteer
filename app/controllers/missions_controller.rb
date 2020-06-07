class MissionsController < ApplicationController
  def index
    @missions = Missions.all 
  end 
end
