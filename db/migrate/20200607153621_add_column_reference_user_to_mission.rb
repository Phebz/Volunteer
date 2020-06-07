class AddColumnReferenceUserToMission < ActiveRecord::Migration[6.0]
  def change
    add_reference :missions, :users, null: false, foreign_key: true
  end
end
