class AddColumnRangeDateToMission < ActiveRecord::Migration[6.0]
  def change
    add_column :missions, :start_date, :date
    add_column :missions, :end_date, :date
  end
end
