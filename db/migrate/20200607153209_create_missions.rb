class CreateMissions < ActiveRecord::Migration[6.0]
  def change
    create_table :missions do |t|
      t.string :name
      t.text :description
      t.integer :capacity
      t.string :location
      t.string :address
      t.references :organization
      
      t.timestamps
    end
  end
end
