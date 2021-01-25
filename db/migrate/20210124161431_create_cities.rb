class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.string :name, null: false, default: ''
      t.belongs_to :country, index: true
    end
  end
end
