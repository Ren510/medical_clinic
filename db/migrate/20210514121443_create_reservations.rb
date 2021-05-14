class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :patient_id
      t.string :title
      t.datetime :start_time
      t.date :day
      t.string :time

      t.timestamps
    end
  end
end
