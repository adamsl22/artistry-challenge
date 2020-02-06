class InstrumentsController < ApplicationController
    def show
        @instrument = Instrument.find(params[:id])
        @artists = @instrument.artists
    end
    def index
        @instruments = Instrument.all
    end
end
