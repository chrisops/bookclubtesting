class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :street, null: false
      t.string :suburb
      t.string :state
      t.string :country, null: false
      t.string :postcode
      t.references :member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
