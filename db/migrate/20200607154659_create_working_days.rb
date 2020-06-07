class CreateWorkingDays < ActiveRecord::Migration[6.0]
  def change
    create_table :working_days do |t|
      t.string :day
      t.time :start_time
      t.time :end_time
      t.references :mission, foreign_key: true

      t.timestamps
    end
  end
end
