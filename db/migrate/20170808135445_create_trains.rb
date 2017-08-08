class CreateTrains < ActiveRecord::Migration[5.0]
  def change
    create_table :trains do |t|
        t.string :number, :index => true #列车号码
      t.timestamps
    end
  end
end
