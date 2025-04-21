class DemoController < ApplicationController
  layout false
  def index
  end

  def hello
    @array = [ 1, 2, 3, 4, 5 ]
    @id = params[:id]
    @page = params[:page]
  end

  def about
    render :about_us
  end

  def contact
    if [ "us", "ca" ].include?(params[:country])
      @phone_number = "(800) 555-6789"
    elsif params[:country] == "uk"
      @phone_number = "(020) 7946 1234"
    else
      @phone_number = "+1(987)654-3210"
    end
    render :contact_us
  end

  def contact_params
    params.require(:country)
  end
end
