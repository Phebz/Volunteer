class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :description
      t.string :location
      t.string :address
      t.references :user 

      t.timestamps
    end
  end
end
