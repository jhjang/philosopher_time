class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :uuid, null: false, unique: true
      t.timestamps
    end
  end
end
