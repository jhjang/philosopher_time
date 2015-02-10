class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :device_id
      t.string :av_label
      t.string :av_number
      t.float :rate
      t.string :comment
      t.datetime :worked_at

      t.timestamps
    end
  end
end
