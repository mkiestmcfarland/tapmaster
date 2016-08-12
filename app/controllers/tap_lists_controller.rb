class TapListsController < ApplicationController
  def show
    puts current_user
    @tap_list = TapList.find_by(user: current_user)
  end
end