class SightingsController < ApplicationController
    def index
      sightings = Sighting.all
      render json: sightings
    end
  
    def create
      animal = Animal.find(params[:animal_id])
      sighting = animal.sightings.create(sighting_params)
  
      if sighting.valid?
        render json: sighting
      else
        render json: sighting.errors
      end
    end
  
    def update
      sighting = Sighting.find(params[:id])
  
      if sighting.update(sighting_params)
        render json: sighting
      else
        render json: sighting.errors
      end
    end

    def destroy
        sighting = Sighting.find(params[:id])
        if sighting.destroy
            render json: sighting
        else
            render json: sighting.errors
        end
    end
  
    private
  
    def sighting_params
      params.require(:sighting).permit(:latitude, :longitude, :date)
    end
  end
  