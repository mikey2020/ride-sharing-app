class CreateRides < ActiveRecord::Migration[5.1]
  def change
    create_table :rides do |t|
      t.string :destination
      t.string :origin
      t.integer :ride_type
      t.datetime :take_off
      t.integer :seats_available
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
