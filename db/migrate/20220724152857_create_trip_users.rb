class CreateTripUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :trip_users do |t|
      t.references :user, foreign_key: true
      t.references :trip, foreign_key: true
      t.integer :role
      t.integer :invite_status, default: 0

      t.timestamps
    end
  end
end
