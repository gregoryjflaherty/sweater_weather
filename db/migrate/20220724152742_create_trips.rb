class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :start_loc
      t.string :end_loc
      t.string :travel_time
      t.float :rating

      t.timestamps
    end
  end
end
