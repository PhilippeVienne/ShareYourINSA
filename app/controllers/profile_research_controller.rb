class ProfileResearchController < ApplicationController

  # GET /find/
  def find
    @profiles = ProfileUser.search(params[:q])
  end

  end