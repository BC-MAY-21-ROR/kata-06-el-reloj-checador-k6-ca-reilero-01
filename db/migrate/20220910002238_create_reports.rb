class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.integer :average_time_month
      t.integer :absence_month
      t.integer :attendance_day
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
