require 'httparty'

class GeomapController < ApplicationController
  
  def index
  end

  def collect_res
    address = params[:address]
    address = address.gsub(" ", "+")
    url = generate_url address
    response = HTTParty.get(url)
    @geojson = JSON.parse(response)
    respond_to do |format|
      format.json { render json: @geojson["features"].first}
    end
  end
  
  private
  
  def generate_url address
    "#{ENV['BASE_URL']}/#{address}.json?access_token=#{ENV['TOKEN']}"
  end
end
