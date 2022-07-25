class CreateTripUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :trip_users do |t|
      t.references :user, foreign_key: true
      t.references :trip, foreign_key: true
      t.integer :permission
      t.boolean :is_a_favorite

      t.timestamps
    end
  end
end
