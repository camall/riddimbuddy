
class StepSequencersController < ApplicationController
    def index
        @studio = Studio.find(params[:studio_id])
        @player = Player.find(params[:player_id])
        @step_sequencers = @player.step_sequencers
    end

    def edit
        @studio = Studio.find(params[:studio_id])
        @player = Player.find(params[:player_id])
        @step_sequencer = StepSequencer.find(params[:id])
    end
    
    def update
        @studio = Studio.find(params[:studio_id])
        @player = Player.find(params[:player_id])
        @step_sequencer = StepSequencer.find(params[:id])
    
        if @step_sequencer.update(update_params)
            redirect_to studio_player_path(@studio, @player)
        else
            render :edit, status: :unprocessable_entity
        end
    end
    

    private


    def update_params
        params.require(:step_sequencer).permit(:stepcode)
    end
end