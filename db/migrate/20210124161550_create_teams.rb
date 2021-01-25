class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :name, null: false, default: ''
      t.belongs_to :league, index: true
      t.belongs_to :city

      t.timestamps
    end
  end
end
