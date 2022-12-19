class CreatePerfects < ActiveRecord::Migration[7.0]
  def change
    create_table :perfects do |t|
      t.string :cuts
      t.string :maxcut
      t.string :input

      t.timestamps
    end
  end
end
