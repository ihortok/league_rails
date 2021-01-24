class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.integer :talent, null: false, default: 0
      t.integer :position_cd
      t.belongs_to :participant

      t.timestamps
    end
  end
end
