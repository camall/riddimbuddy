class StepSequencer < ApplicationRecord
    belongs_to :sample
    belongs_to :player
end