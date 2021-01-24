class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      t.string :first_name
      t.string :last_name, null: false, default: ''
      t.datetime :date_of_birth
      t.belongs_to :country
      t.datetime :caree_start
      t.datetime :caree_end

      t.timestamps
    end
  end
end
