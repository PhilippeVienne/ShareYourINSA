class ShowRoomProfilesController < ApplicationController
  def index
  end

  def data
    @profiles = ShowRoomProfile.where(active: true).order(:position)
  end
end
