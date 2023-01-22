class PlayersController < ApplicationController
    def new
        @studio = Studio.find(params[:studio_id])
        @player = Player.new
    end

    def create
        @studio = Studio.find(params[:studio_id])
        @player = @studio.players.create(player_params)

        Sample.all.each do |sample|
            @player.step_sequencers.create(sample: sample, stepcode: '00000000')
        end

        if @player.save
            redirect_to [@studio, @player]
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show
        @studio = Studio.find(params[:studio_id])
        @player = Player.find(params[:id])
    end

    private

    def player_params
        params.require(:player).permit(:name)
    end
end