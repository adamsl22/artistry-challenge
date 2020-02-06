class ArtistsController < ApplicationController
    def new
        @artist = Artist.new
        @errors = flash[:errors]
    end
    def create
        @artist = Artist.new(artist_params(:name, :age, :title))
        if @artist.valid?
            @artist.save
            redirect_to artist_path(@artist)
        else
            flash[:errors] = @artist.errors.full_messages
            redirect_to new_artist_path
        end
    end
    def show
        @artist = Artist.find(params[:id])
        @instruments = @artist.instruments
    end
    def add_instrument
        @play = Play.new
        @artist = Artist.find(params[:id])
        @instruments = Instrument.all
    end
    def play_instrument
        @artist = Artist.find(params[:id])
        i_id = play_params(:instrument_id)[:instrument_id]
        Play.create(artist_id: @artist.id, instrument_id: i_id)
        redirect_to artist_path(@artist)
    end
    def index
        @artists = Artist.all
    end
    private
    def artist_params(*args)
        params.require(:artist).permit(*args)
    end
    def play_params(*args)
        params.require(:play).permit(*args)
    end
end
