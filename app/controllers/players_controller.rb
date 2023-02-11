class PlayersController < ApplicationController
    before_action :get_studio
    
    def new
        @player = Player.new
    end

    def create
        @player = @studio.players.create(player_params)

        Sample.first(3).each do |sample|
            @player.step_sequencers.create(sample: sample, stepcode: '00000000')
        end

        if @player.save
            redirect_to edit_studio_player_path(@studio, @player)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show
        @player = Player.find(params[:id])
    end

    def edit
        @player = Player.find(params[:id])
    end

    private

    def get_studio
        @studio = Studio.find(params[:studio_id])
    end

    def player_params
        params.require(:player).permit(:name)
    end
end