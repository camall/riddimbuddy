
class StepSequencersController < ApplicationController
    before_action :get_studio, :get_player

    def index
        @step_sequencers = @player.step_sequencers
    end

    def edit
        @step_sequencer = StepSequencer.find(params[:id])
    end
    
    def update
        @step_sequencer = StepSequencer.find(params[:id])
    
        if @step_sequencer.update(update_params)
            redirect_to edit_studio_player_path(@studio, @player)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private

    def get_studio
        @studio = Studio.find(params[:studio_id])
    end

    def get_player
        @player = Player.find(params[:player_id])
    end


    def update_params
        params.require(:step_sequencer).permit(:stepcode, :sample_id)
    end
end