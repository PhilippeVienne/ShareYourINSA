class ProfileResearchController < ApplicationController

#GET /find/
  def find_user
    @found_users = User.find_by_name(:q) || {}
    render json: @found_users
  end

  end