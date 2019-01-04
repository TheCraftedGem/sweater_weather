class Forecast < ActiveRecord::Migration[5.2]
  def change
      create_table :forecast do |t|
      t.string :location

      t.timestamps
      end
  end
end
