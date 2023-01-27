class StudiosController < ApplicationController
    def index
        @studios = Studio.all
    end

    def show
        @studio = Studio.find(params[:id])
        @step_sequencers = StepSequencer.where(player: @studio.players)
    end

    def new
        @studio = Studio.new
    end

    def create
        @studio = Studio.new(studio_params)

        if @studio.save
            redirect_to studio_path(@studio)
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def studio_params
        params.require(:studio).permit(:name)
    end
end