class AddScreenIdToReservations < ActiveRecord::Migration[7.1]
  def change
    add_reference :reservations, :screen, foreign_key: true, null: false
  
    remove_index :reservations, name:"index_date_schedule_sheet"

    add_index :reservations, [:date, :schedule_id, :sheet_id, :screen_id], unique: true, name: "index_date_schedule_sheet_screen"
  
  end
end
