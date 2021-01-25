class CreateContracts < ActiveRecord::Migration[6.1]
  def change
    create_table :contracts do |t|
      t.belongs_to :participant
      t.belongs_to :team
      t.integer :position_cd
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
