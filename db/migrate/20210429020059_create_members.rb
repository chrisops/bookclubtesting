class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :email, null: false, unique: true
      t.string :password, null: false

      t.timestamps
    end
  end
end
