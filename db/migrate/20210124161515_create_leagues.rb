class CreateLeagues < ActiveRecord::Migration[6.1]
  def change
    create_table :leagues do |t|
      t.string :name, null: false, default: ''
      t.integer :team_size, null: false, default: 1
      t.integer :first_team_size, null: false, default: 1
      t.belongs_to :country

      t.timestamps
    end
  end
end
