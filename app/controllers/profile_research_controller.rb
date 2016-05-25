class ProfileResearchController < ApplicationController

  # GET /find/
  def find
    @profiles = ProfileUser.where(first_name:params[:q])
  end

  end