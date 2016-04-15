class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|

    	t.string :city
    	t.string :state
    	t.string :country
    	t.integer :rating
    	t.text :tips 

      t.timestamps null: false
    end
  end
end
