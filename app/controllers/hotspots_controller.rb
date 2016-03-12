class HotspotsController < ApplicationController
  def hotspot_params
    params.require(:hotspot).permit(:issue_type, :location, :occurred_time, :details, :report_num, :to_share, :creator_name, :creator_email, :creator_number)
  end
  
  def new
    @hotspot = Hotspot.new
  end

  def create
    @hotspot = Hotspot.new(hotspot_params)
    if @hotspot.save
        flash[:notice] = "You have successfully reported an issue. Thank you!"
        redirect_to new_hotspot_path
    else
        flash.now[:warning] = "You have not filled out all required fields."
        render :new
    end
  end
end