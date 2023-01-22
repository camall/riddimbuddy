class CreateStepSequencers < ActiveRecord::Migration[7.0]
  def change
    create_table :step_sequencers do |t|
      t.string :stepcode

      t.references :player
      t.references :sample

      t.timestamps
    end
  end
end
