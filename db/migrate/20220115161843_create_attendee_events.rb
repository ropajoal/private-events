class CreateAttendeeEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :attendee_events do |t|
      t.references :attendee, null: false, foreign_key: { to_table: :users }
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
