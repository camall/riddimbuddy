class Player < ApplicationRecord
    belongs_to :studio
    has_many :step_sequencers
end