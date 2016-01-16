require 'httparty'

class GeomapController < ApplicationController
  
  def index
  end
  
  # def collect_res
    # address = params[:address]
    # base_url = "https://api.mapbox.com/geocoding/v5/mapbox.places"
    # token = "pk.eyJ1Ijoic2hyaWthbnQxNzEyIiwiYSI6ImNpamZmZWFuYjAwMmh0aG01Nmc0eTN1YXMifQ.QoRy6gmX07mtZ8cwiRue-w"
    # url = "#{base_url}/#{address}.json?access_token=#{token}"
    # response = HTTParty.get(url)
    # p "-----------------"
    # @geojson = JSON.parse(response)
    # features = @geojson["features"].first
    # p features["center"]
    # @geo = MapBuilder.build_map(features)
    # p "-----------------" 
    # respond_to do |format|
      # format.json { render json: @geo }
    # end
  # end
  
  def collect_res
    address = params[:address]
    base_url = "https://api.mapbox.com/geocoding/v5/mapbox.places"
    token = "pk.eyJ1Ijoic2hyaWthbnQxNzEyIiwiYSI6ImNpamZmZWFuYjAwMmh0aG01Nmc0eTN1YXMifQ.QoRy6gmX07mtZ8cwiRue-w"
    url = "#{base_url}/#{address}.json?access_token=#{token}"
    response = HTTParty.get(url)
    @geojson = JSON.parse(response)
    p "---------------------------"
    p @geojson["features"].first
    p "---------------------------"
    respond_to do |format|
      format.json { render json: @geojson["features"].first}
    end
  end
end
