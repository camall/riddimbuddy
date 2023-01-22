class PlayersController < ApplicationController
    def new
        @studio = Studio.find(params[:studio_id])
        @player = Player.new
    end

    def create
        @studio = Studio.find(params[:studio_id])
        @player = @studio.players.create(player_params)

        if @player.save
            render :new, status: :unprocessable_entity
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def player_params
        params.require(:player).permit(:name)
    end
end